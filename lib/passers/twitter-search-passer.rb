require_relative "passer"
require "uri"
require "time"
require "eventmachine"
require "twitter/json_stream"
require "yajl"


class TwitterSearchPasser < Passer
  def initialize(query, exclude = nil)
    @query   = query
    @exclude = exclude
    @oauth   = configatron.twitter.oauth.to_hash
    @ignore  = configatron.twitter.ignore || []

    super(:stream, "tweet-#{query}")
  end

  def start
    prev    = nil
    current = Time.now.strftime("%Y%m%d%H")
    logfile = open(File.join(File.dirname(__FILE__), "..", "..", "db", "tweets", "#{@query}.#{current}"), "a+")

    EventMachine::run {
      EventMachine::defer {
        begin
          stream = Twitter::JSONStream.connect({
            :path  => "/1/statuses/filter.json?track=#{URI.encode(@query)}",
            :ssl   => true,
            :oauth => @oauth
          })

          stream.each_item { |item|
            tweet = Yajl::Parser.parse(item)

            next if @ignore.include? tweet["user"]["screen_name"]
            next if @exclude && tweet["text"].include?(@exclude)

            puts "[%s] @%s: %s" % [Time.parse(tweet["created_at"]).strftime("%H:%M:%S"), tweet["user"]["screen_name"], tweet["text"]]
            pass(tweet)

            current = Time.now.strftime("%Y%m%d%H")
            unless current == prev
              logfile.close
              logfile = open(File.join(File.dirname(__FILE__), "..", "..", "db", "tweets", "#{@query}.#{current}"), "a+")
            end

            logfile.puts tweet

            prev = current
          }

          stream.on_error { |message|
            puts message
          }

          trap('TERM') {
            stream.stop
            EventMachine.stop if EventMachine.reactor_running?
          }
        rescue => e
          puts e
          exit
        end
      }
    }

    logfile.close
  end
end

query   = ARGV[0] || "sprk2012"
exclude = ARGV[1]
puts "Query   : #{query}"
puts "Exclude : #{exclude}"

twitter = TwitterSearchPasser.new(query, exclude)
twitter.start
