class CreateTemperatures < ActiveRecord::Migration[7.0]
  def change
    create_table :temperatures do |t|
      t.time :time, null: false
      t.float :temperature, null: false
      t.string :memo

      t.timestamps
    end
  end
end
