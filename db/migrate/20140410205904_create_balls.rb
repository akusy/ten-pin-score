class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :pins
      t.integer :number
      t.integer :knock, default: 1
      t.integer :frame_id, null: false

      t.timestamps
    end
  end
end
