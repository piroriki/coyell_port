class CreateSymptoms < ActiveRecord::Migration[7.0]
  def change
    create_table :symptoms do |t|
      t.time :time, null: false
      t.integer :kinds, null: false, default: 0
      t.string :memo

      t.timestamps
    end
  end
end
