class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :screen_id,  :null => false
      t.integer :channel_id, :null => false

      t.timestamps
    end
  end
end
