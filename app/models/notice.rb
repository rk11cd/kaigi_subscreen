class Notice < ActiveRecord::Base
  validates :message,      :presence => true
  validates :status,       :presence => true
  validates :requested_by, :presence => true

  attr_accessible :message, :requested_by # NOTE is it OK?

  scope :published, where("status = 'published'")
end
