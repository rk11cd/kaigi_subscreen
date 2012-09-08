# -*- coding: utf-8 -*-

require_relative "passer"
require "eventmachine"

class SeeyouPasser < Passer
  def initialize(name)
    super(:stream, name)
    @messages = ["またお会いしましょう！", "See you again!"]
    @count = 0
  end

  def trigger
    data = {
      :channel => "channel", :nick => "RubyKaigi",
      :message => @messages[@count % 2],
      :usec => Time.now.usec
    }
    p ["Irc Example", data]
    pass(data)
    @count += 1
  end
end

EventMachine::run {
  seeyou2    = SeeyouPasser.new("irc-kaigi1-m17n")

  EventMachine::add_periodic_timer(1) {
    seeyou2.trigger
  }
}
