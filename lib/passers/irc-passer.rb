require_relative "passer"
require "bundler"
Bundler.require
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
    html = RailsEmoji.render(CGI.escapeHTML(message), :class => :emoji)

    @passers[channel.sub(/^#/,"").downcase].pass(:nick => nick, :message => html, :usec => Time.now.usec)
  end
end

class IrcPasser < Passer
  def initialize(channel)
    super(:stream, "irc-"+channel)
  end
end

client = Client.new(configatron.irc.server, configatron.irc.port,
                    {
                      :user     => configatron.irc.user,
                      :nick     => configatron.irc.nick,
                      :real     => configatron.irc.real,
                      :pass     => configatron.irc.pass,
                      :channels => configatron.irc.channels
                    })
client.start
