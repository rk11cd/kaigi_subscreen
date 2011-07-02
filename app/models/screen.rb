class Screen < ActiveRecord::Base
  validates :name,        :presence => true
  validates :tweet,       :presence => true
  validates :chat,        :presence => true
  validates :translation, :presence => true
end
