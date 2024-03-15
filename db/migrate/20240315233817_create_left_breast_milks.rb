class CreateLeftBreastMilks < ActiveRecord::Migration[7.0]
  def change
    create_table :left_breast_milks do |t|
      t.time :time, null: false
      t.string :memo

      t.timestamps
    end
  end
end
