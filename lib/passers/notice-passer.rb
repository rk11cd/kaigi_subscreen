require_relative "passer"
require "open-uri"
require "yajl"

class NoticePasser < Passer
  def initialize(url)
    @url = url
    super(:notice, :notice)
  end

  def start(interval = 10)
    loop do
      notice = Yajl.load(open(@url))
      p notice
      pass(notice)
      sleep interval
    end
  end
end

notice = NoticePasser.new("http://subscreen.dev/notices/sample.json")
notice.start
