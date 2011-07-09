require_relative "passer"
require "net/irc"

class Client < Net::IRC::Client
  def initialize(passer, host, port, options = {})
    super(host, port, options)

    @channels = options[:channels]
    @passer   = passer
  end

  def on_rpl_welcome(m)
    @channels.each do |channel|
      post JOIN, "##{channel}"
    end
  end

  def on_privmsg(m)
    channel, message = *m
    nick = m.prefix.nick.to_s

    @passer.pass(:channel => channel, :nick => nick, :message => message)
  end
end

class IrcPasser < Passer
  def initialize
    super(:stream, :irc)
  end
end

channels = %w(rubykaigi rubykaigi1 rubykaigi2)
passer = IrcPasser.new
client = Client.new(passer, "irc.freenode.net", 6667,
                    {
                      :user     => configatron.freenode.user,
                      :nick     => configatron.freenode.nick,
                      :real     => configatron.freenode.real,
                      :pass     => configatron.freenode.pass,
                      :channels => channels
                    })
client.start
