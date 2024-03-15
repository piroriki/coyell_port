class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.time :time, null: false
      t.integer :kinds, null: false, default: 0
      t.string :memo, null: false

      t.timestamps
    end
  end
end
