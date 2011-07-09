class Screen < ActiveRecord::Base
  validates :name,        :presence => true
  validates :description, :presence => true

  has_many :assignments
  has_many :channels, :through => :assignments
end
