class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.integer :game_id, null: false
      t.integer :knock, default: 1
      t.integer :number
      t.integer :points

      t.timestamps
    end
  end
end
