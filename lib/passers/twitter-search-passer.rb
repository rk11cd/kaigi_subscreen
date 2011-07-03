require_relative "passer"
require "twitter/json_stream"
require "eventmachine"
require "yajl"

class TwitterSearchPasser < Passer
  def initialize
    username = configatron.twitter.username
    password = configatron.twitter.password

    @auth = "#{username}:#{password}"

    super(:stream, :tweet)
  end

  def start(query)
    EventMachine::run {
      EventMachine::defer {
        stream = Twitter::JSONStream.connect(
                   :path => "/1/statuses/filter.json?track=#{query}", :auth => @auth
                 )

        stream.each_item do |status|
          begin
            tweet = Yajl.load(status)
            p tweet
            pass(tweet)
          rescue => e
            p e
          end
        end
      }
    }
  end
end

query = ARGV[0] || "rubykaigi"
p query

twitter = TwitterSearchPasser.new
twitter.start(query)
