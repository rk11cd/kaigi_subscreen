class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.text   :message,      :null => false
      t.string :status,       :null => false, :default => "draft"
      t.string :requested_by, :null => false

      t.timestamps
    end
  end
end
