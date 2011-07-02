class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string  :name,        :null => false
      t.boolean :tweet,       :null => false, :default => false
      t.boolean :chat,        :null => false, :default => false
      t.boolean :translation, :null => false, :default => false

      t.timestamps
    end
  end
end
