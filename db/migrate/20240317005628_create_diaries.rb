class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.string :content, null: false
      
      t.timestamps
    end
  end
end
