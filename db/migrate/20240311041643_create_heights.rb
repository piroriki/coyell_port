class CreateHeights < ActiveRecord::Migration[7.0]
  def change
    create_table :heights do |t|
      t.integer :height, null: false

      t.timestamps
    end
  end
end
