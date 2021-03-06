class Notice < ActiveRecord::Base
  validates :message,      :presence => true
  validates :status,       :presence => true
  validates :requested_by, :presence => true

  scope :published, where("status = 'published'")
end
