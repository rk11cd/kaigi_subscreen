# -*- coding: utf-8 -*-

require_relative "passer"
require "eventmachine"

class TwitterExamplePasser < Passer
  def initialize
    super(:stream, :tweet)
    @users = %w(june29 darashi kei_s).map { |name| { "screen_name" => name,"profile_image_url" => "http://api.dan.co.jp/twicon/#{name}/normal" }}
    @texts = %w(かしゆかでーす あーちゃんでーす のっちでーす)
  end

  def trigger
    data = { "user" => @users.sample, "id" => "xxx", "text" => @texts.sample }
    p ["Twitter Example", data]
    pass(data)
  end
end

class NoticeExamplePasser < Passer
  def initialize
    super(:notice, :notice)
    @messages = %w(日本Ruby会議2011がはじまりました。これが最後のRuby会議です。最後まで思い切り楽しみましょう！
                   3人あわせてPerfumeです。
                   落とし物が届いております。お心当たりの方は受付までお越しください。
                   闇RubyKaigiが開催されます。
                )
  end

  def trigger
    data = { "message" => @messages.sample }
    p ["Notice Example", data]
    pass(data)
  end
end

class IrcExamplePasser < Passer
  def initialize
    super(:stream, :irc)
    @messages = %w(hi hello irc text message world)
  end

  def trigger
    data = { :channel => "channel", :nick => "nick", :message => @messages.sample }
    p ["Irc Example", data]
    pass(data)
  end
end

EventMachine::run {
  twitter = TwitterExamplePasser.new
  notice  = NoticeExamplePasser.new
  irc     = IrcExamplePasser.new

  EventMachine::add_periodic_timer(0.5) {
    twitter.trigger
  }

  EventMachine::add_periodic_timer(0.6) {
    notice.trigger
  }

  EventMachine::add_periodic_timer(0.7) {
    irc.trigger
  }
}
