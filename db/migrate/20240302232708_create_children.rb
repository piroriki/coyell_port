class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name, null: false, unique: true
      t.integer :gender, null: false, default: 0
      t.integer :age, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
