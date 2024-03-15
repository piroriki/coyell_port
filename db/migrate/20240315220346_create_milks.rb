class CreateMilks < ActiveRecord::Migration[7.0]
  def change
    create_table :milks do |t|
      t.integer :amount, null: false
      t.time :time, null: false
      t.string :memo

      t.timestamps
    end
  end
end
