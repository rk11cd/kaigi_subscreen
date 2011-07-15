require_relative "passer"
require "uri"
require "yajl"
require "yajl/http_stream"

class TwitterSearchPasser < Passer
  def initialize(auth, query, exclude = nil)
    setting = configatron.twitter.to_hash
    username = setting[auth.to_sym][:username]
    password = setting[auth.to_sym][:password]

    @query   = query
    @exclude = exclude
    @ignore  = configatron.twitter.ignore || []
    @auth    = "#{username}:#{password}"

    super(:stream, "tweet-#{query}")
  end

  def start
    prev    = nil
    current = Time.now.strftime("%Y%m%d%H")
    logfile = open(File.join(File.dirname(__FILE__), "..", "..", "db", "tweets", "#{@query}.#{current}"), "a+")

    uri = URI.parse("http://#{@auth}@stream.twitter.com/1/statuses/filter.json?track=#{URI.encode(@query)}")
    Yajl::HttpStream.get(uri) do |tweet|
      next if @ignore.include? tweet["user"]["screen_name"]
      next if @exclude && tweet["text"].include?(@exclude)

      p tweet
      pass(tweet)

      current = Time.now.strftime("%Y%m%d%H")
      unless current == prev
        logfile.close
        logfile = open(File.join(File.dirname(__FILE__), "..", "..", "db", "tweets", "#{@query}.#{current}"), "a+")
      end

      logfile.puts tweet

      prev = current
    end

    logfile.close
  end
end

auth = ARGV[0]
query   = ARGV[1] || "rubykaigi"
exclude = ARGV[2]
p query, exclude

twitter = TwitterSearchPasser.new(auth, query, exclude)
twitter.start
