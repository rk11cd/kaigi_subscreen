require "passers/passer"

class Screen < ActiveRecord::Base
  validates :name,        :presence => true
  validates :description, :presence => true

  attr_accessible :name, :description # NOTE is it OK?

  has_many :assignments
  has_many :channels, :through => :assignments

  def channels_as_hash
    Hash[self.channels.group_by(&:group).map{|k,v| [k,v.map(&:name)] }]
  end

  def send_update
    passer = Passer.new("signal","update-#{self.id}")
    passer.pass(self.channels_as_hash)
  end
end
