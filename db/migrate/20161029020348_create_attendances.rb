class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.string :dish, null: false
      t.integer :potluck_id, null: false
      t.integer :user_id, null: false
      t.timestamps(null: false)
    end
  end
end
