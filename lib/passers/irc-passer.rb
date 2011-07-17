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

    @passers[channel.sub(/^#/,"").downcase].pass(:nick => nick, :message => message, :usec => Time.now.usec)
  end
end

class IrcPasser < Passer
  def initialize(channel)
    super(:stream, "irc-"+channel)
  end
end

channels = %w(rubykaigi kaigi1 kaigi2 kaigi1-m17n kaigi2-m17n rubykaigi-staff)
client = Client.new("irc.rubykaigi.org", 6667,
                    {
                      :user     => configatron.irc.user,
                      :nick     => configatron.irc.nick,
                      :real     => configatron.irc.real,
                      :pass     => configatron.irc.pass,
                      :channels => channels
                    })
client.start
