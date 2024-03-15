class CreateWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :weights do |t|
      t.float :weight, null: false

      t.timestamps
    end
  end
end
