class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :name
      t.boolean :tweet
      t.boolean :chat
      t.boolean :translation

      t.timestamps
    end
  end
end
