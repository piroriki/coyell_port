class CreateHeadCircumferences < ActiveRecord::Migration[7.0]
  def change
    create_table :head_circumferences do |t|
      t.time :time, null: false
      t.float :length, null: false
      t.string :memo

      t.timestamps
    end
  end
end
