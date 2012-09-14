class Assignment < ActiveRecord::Base
  validates :screen,  :presence => true
  validates :channel, :presence => true

  belongs_to :screen
  belongs_to :channel

  attr_accessible :screen, :channel # NOTE is it OK?
end
