class Channel < ActiveRecord::Base
  validates :group,  :presence => true
  validates :name,   :presence => true

  has_many :assignments
  has_many :screens, :through => :assignments

  attr_accessible :group, :name # NOTE is it OK?
end
