class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string  :group,     :null => false
      t.string  :name,      :null => false

      t.timestamps
    end
  end
end
