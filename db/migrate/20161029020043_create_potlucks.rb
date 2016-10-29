class CreatePotlucks < ActiveRecord::Migration[5.0]
  def change
    create_table :potlucks do |t|
        t.string :name, null: false
        t.string :location, null: false
        t.datetime :time, null: false
        t.integer :uder_id, null: false
      t.timestamps(null: false)
    end
  end
end
