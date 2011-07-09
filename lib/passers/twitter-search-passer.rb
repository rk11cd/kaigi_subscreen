require_relative "passer"
require "uri"
require "yajl"
require "yajl/http_stream"

class TwitterSearchPasser < Passer
  def initialize
    username = configatron.twitter.username
    password = configatron.twitter.password

    @ignore = configatron.twitter.ignore
    @auth   = "#{username}:#{password}"

    super(:stream, :tweet)
  end

  def start(query)
    uri = URI.parse("http://#{@auth}@stream.twitter.com/1/statuses/filter.json?track=#{URI.encode(query)}")
    Yajl::HttpStream.get(uri) do |tweet|
      p tweet
      pass(tweet)
    end
  end
end

query = ARGV[0] || "rubykaigi"
p query

twitter = TwitterSearchPasser.new
twitter.start(query)
