Getting started
===============

Connect to redis:

    require 'em-hiredis'
    redis = EM::Hiredis.connect

Or, connect to redis with a redis URL (for a different host, port, password, DB)

    redis = EM::Hiredis.connect("redis://:secretpassword@example.com:9000/4")

The client is a deferrable which succeeds when the underlying connection is established so you can bind to this. This isn't necessary however - any commands sent before the connection is established (or while reconnecting) will be sent to redis on connect.

    redis.callback { puts "Redis now connected" }

All redis commands are available without any remapping of names

    redis.set('foo', 'bar').callback {
      redis.get('foo').callback { |value|
        p [:returned, value]
      }
    }

As a shortcut, if you're only interested in binding to the success case you can simply provide a block to any command

    redis.get('foo') { |value|
      p [:returned, value]
    }

Handling failure
----------------

All commands return a deferrable. In the case that redis replies with an error (for example you called a hash operation against a set), or in the case that the redis connection is broken before the command returns, the deferrable will fail. If you care about the failure case you should bind to the errback - for example:

    redis.sadd('aset', 'member').callback {
      response_deferrable = redis.hget('aset', 'member')
      response_deferrable.errback { |e|
        p e # => #<RuntimeError: ERR Operation against a key holding the wrong kind of value>
      }
    }

Pubsub
------

This example should explain things. Once a redis connection is in a pubsub state, you must make sure you only send pubsub commands.

    redis = EM::Hiredis.connect
    subscriber = EM::Hiredis.connect

    subscriber.subscribe('bar.0')
    subscriber.psubscribe('bar.*')

    subscriber.on(:message) { |channel, message|
      p [:message, channel, message]
    }

    subscriber.on(:pmessage) { |key, channel, message|
      p [:pmessage, key, channel, message]
    }

    EM.add_periodic_timer(1) {
      redis.publish("bar.#{rand(2)}", "hello").errback { |e|
        p [:publisherror, e]
      }
    }

Hacking
-------

Hacking on em-hiredis is pretty simple, make sure you have Bundler installed:

    gem install bundler
    bundle

To run all the tests:

    rake

To run an individual test:

    bundle exec rspec spec/redis_commands_spec.rb

Much thanks to the em-redis gem for getting this gem bootstrapped with some tests.
