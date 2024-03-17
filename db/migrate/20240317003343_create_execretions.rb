class CreateExecretions < ActiveRecord::Migration[7.0]
  def change
    create_table :execretions do |t|
      t.time :time, null: false
      t.string :memo

      t.timestamps
    end
  end
end
