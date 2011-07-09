require_relative "passer"
require "net/irc"

class Client < Net::IRC::Client
  def initialize(host, port, options = {})
    super(host, port, options)

    @passers = Hash[options[:channels].map(&:downcase).map{|channel|
      [channel, IrcPasser.new(channel)]
    }]
  end

  def on_rpl_welcome(m)
    @passers.keys.each do |channel|
      post JOIN, "##{channel}"
    end
  end

  def on_privmsg(m)
    channel, message = *m
    nick = m.prefix.nick.to_s

    @passers[channel.sub(/^#/,"").downcase].pass(:nick => nick, :message => message)
  end
end

class IrcPasser < Passer
  def initialize(channel)
    super(:stream, "irc-"+channel)
  end
end

channels = %w(rubykaigi rubykaigi1 rubykaigi2)
client = Client.new("irc.freenode.net", 6667,
                    {
                      :user     => configatron.freenode.user,
                      :nick     => configatron.freenode.nick,
                      :real     => configatron.freenode.real,
                      :pass     => configatron.freenode.pass,
                      :channels => channels
                    })
client.start
