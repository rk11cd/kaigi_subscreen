class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string  :name,        :null => false
      t.string  :description, :null => false

      t.timestamps
    end
  end
end
