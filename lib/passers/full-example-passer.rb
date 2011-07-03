# -*- coding: utf-8 -*-

require_relative "passer"
require "eventmachine"

class TwitterExamplePasser < Passer
  def initialize
    super(:stream, :tweet)
    @users = %w(june29 darashi kei_s).map { |name| { "screen_name" => name,"profile_image_url" => "http://api.dan.co.jp/twicon/#{name}/normal" }}
    @texts = %w(かしゆかでーす あーちゃんでーす のっちでーす)
  end

  def start
    loop do
      data = { "user" => @users.sample, "id" => "xxx", "text" => @texts.sample }
      p ["Twitter Example", data]
      pass(data)
      sleep 1.2
    end
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

  def start
    loop do
      data = { "message" => @messages.sample }
      p ["Notice Example", data]
      pass(data)
      sleep 3
    end
  end
end

EventMachine::run {
  EventMachine::defer {
    twitter = TwitterExamplePasser.new
    twitter.start
  }

  EventMachine::defer {
    notice = NoticeExamplePasser.new
    notice.start
  }
}
