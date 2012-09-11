require_relative "passer"
require "open-uri"
require "yajl"

class NoticePasser < Passer
  def initialize(url)
    @url = url
    super(:notice, :notice)
  end

  def start(interval = 10)
    prev = nil

    loop do
      notice = Yajl.load(open("#{@url}?excludes=#{prev}"))
      p notice

      unless notice.nil?
        pass(notice)
        prev = notice["id"]
      end

      sleep interval
    end
  end
end

notice = NoticePasser.new("http://sprk2012subscreen.herokuapp.com/notices/sample.json")
notice.start
