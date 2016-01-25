class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.integer :status
      t.references :user
      t.date :emotion_on, null: false

      t.timestamps null: false
    end
  end
end
