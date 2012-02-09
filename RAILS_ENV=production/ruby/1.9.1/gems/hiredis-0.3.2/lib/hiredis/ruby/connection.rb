require "socket"
require "timeout"
require "hiredis/ruby/reader"
require "hiredis/version"

module Hiredis
  module Ruby
    class Connection

      def initialize
        @sock = nil
      end

      def connected?
        !! @sock
      end

      def connect(host, port, usecs = 0)
        @reader = ::Hiredis::Ruby::Reader.new

        begin
          begin
            Timeout.timeout(usecs.to_f / 1_000_000) do
              @sock = TCPSocket.new(host, port)
              @sock.setsockopt Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1
            end
          rescue Timeout::Error
            raise Errno::ETIMEDOUT
          end
        rescue SocketError => error
          # Raise RuntimeError when host cannot be resolved
          if error.message.start_with?("getaddrinfo:")
            raise error.message
          else
            raise error
          end
        end
      end

      def connect_unix(path, usecs = 0)
        @reader = ::Hiredis::Ruby::Reader.new

        begin
          Timeout.timeout(usecs.to_f / 1_000_000) do
            @sock = UNIXSocket.new(path)
          end
        rescue Timeout::Error
          raise Errno::ETIMEDOUT
        end
      end

      def disconnect
        @sock.close
      rescue
      ensure
        @sock = nil
      end

      def timeout=(usecs)
        raise "not connected" unless connected?

        secs   = Integer(usecs / 1_000_000)
        usecs  = Integer(usecs - (secs * 1_000_000)) # 0 - 999_999

        optval = [secs, usecs].pack("l_2")

        begin
          @sock.setsockopt Socket::SOL_SOCKET, Socket::SO_RCVTIMEO, optval
          @sock.setsockopt Socket::SOL_SOCKET, Socket::SO_SNDTIMEO, optval
        rescue Errno::ENOPROTOOPT
        end
      end

      COMMAND_DELIMITER = "\r\n".freeze

      def write(args)
        command = []
        command << "*#{args.size}"
        args.each do |arg|
          arg = arg.to_s
          command << "$#{string_size arg}"
          command << arg
        end

        @sock.syswrite(command.join(COMMAND_DELIMITER) + COMMAND_DELIMITER)
      end

      def read
        raise "not connected" unless connected?

        while (reply = @reader.gets) == false
          @reader.feed @sock.sysread(1024)
        end

        reply
      rescue EOFError
        raise Errno::ECONNRESET
      end

    protected

      if "".respond_to?(:bytesize)
        def string_size(string)
          string.to_s.bytesize
        end
      else
        def string_size(string)
          string.to_s.size
        end
      end
    end
  end
end
