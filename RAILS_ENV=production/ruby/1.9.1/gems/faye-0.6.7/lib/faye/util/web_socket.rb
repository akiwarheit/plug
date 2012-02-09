module Faye
  class WebSocket
    
    autoload :Draft75Parser, File.expand_path('..', __FILE__) + '/web_socket/draft75_parser'
    autoload :Draft76Parser, File.expand_path('..', __FILE__) + '/web_socket/draft76_parser'
    autoload :Protocol8Parser, File.expand_path('..', __FILE__) + '/web_socket/protocol8_parser'
    
    include Publisher
    
    CONNECTING = 0
    OPEN       = 1
    CLOSING    = 2
    CLOSED     = 3
    
    attr_reader   :request, :url, :ready_state
    attr_accessor :onopen, :onmessage, :onerror, :onclose
    
    extend Forwardable
    def_delegators :@parser, :version
    
    def self.parser(request)
      if request.env['HTTP_SEC_WEBSOCKET_VERSION']
        Protocol8Parser
      elsif request.env['HTTP_SEC_WEBSOCKET_KEY1']
        Draft76Parser
      else
        Draft75Parser
      end
    end
    
    def initialize(request)
      @request  = request
      @callback = @request.env['async.callback']
      @stream   = Stream.new
      @callback.call [200, RackAdapter::TYPE_JSON, @stream]
      
      @url = determine_url
      @ready_state = CONNECTING
      @buffered_amount = 0
      
      @parser = WebSocket.parser(@request).new(self)
      @stream.write(@parser.handshake_response)
      
      @ready_state = OPEN
      
      event = Event.new
      event.init_event('open', false, false)
      dispatch_event(event)
      
      @request.env[Thin::Request::WEBSOCKET_RECEIVE_CALLBACK] = @parser.method(:parse)
    end
    
    def receive(data)
      event = Event.new
      event.init_event('message', false, false)
      event.data = Faye.encode(data)
      dispatch_event(event)
    end
    
    def send(data, type = nil, error_type = nil)
      frame = @parser.frame(Faye.encode(data), type, error_type)
      @stream.write(frame) if frame
    end
    
    def close(*args)
    end
    
    def add_event_listener(type, listener, use_capture)
      add_subscriber(type, listener)
    end
    
    def remove_event_listener(type, listener, use_capture)
      remove_subscriber(type, listener)
    end
    
    def dispatch_event(event)
      event.target = event.current_target = self
      event.event_phase = Event::AT_TARGET
      
      publish_event(event.type, event)
      callback = __send__("on#{ event.type }")
      callback.call(event) if callback
    end
    
  private
    
    def determine_url
      env = @request.env
      secure = if env.has_key?('HTTP_X_FORWARDED_PROTO')
                 env['HTTP_X_FORWARDED_PROTO'] == 'https'
               else
                 env['HTTP_ORIGIN'] =~ /^https:/i
               end
      
      scheme = secure ? 'wss:' : 'ws:'
      "#{ scheme }//#{ env['HTTP_HOST'] }#{ env['REQUEST_URI'] }"
    end
  end
  
  class WebSocket::Stream
    include EventMachine::Deferrable
    
    def each(&callback)
      @data_callback = callback
    end
    
    def write(data)
      return unless @data_callback
      @data_callback.call(data)
    end
  end
  
  class WebSocket::Event
    attr_reader   :type, :bubbles, :cancelable
    attr_accessor :target, :current_target, :event_phase, :data
    
    CAPTURING_PHASE = 1
    AT_TARGET       = 2
    BUBBLING_PHASE  = 3
    
    def init_event(event_type, can_bubble, cancelable)
      @type       = event_type
      @bubbles    = can_bubble
      @cancelable = cancelable
    end
    
    def stop_propagation
    end
    
    def prevent_default
    end
  end
  
end

