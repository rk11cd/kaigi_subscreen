require "bundler"
Bundler.setup(:default, :development)

require "pusher"
require "configatron"

load File.join(File.dirname(__FILE__), "..", "..", "config", "initializers", "0_load_config.rb")

class Passer
  def initialize(channel, event)
    Pusher.app_id = configatron.pusher.app_id
    Pusher.key    = configatron.pusher.key
    Pusher.secret = configatron.pusher.secret

    @channel = channel
    @event   = event
  end

  def pass(data)
    Pusher[@channel].trigger!(@event, data)
  end
end
