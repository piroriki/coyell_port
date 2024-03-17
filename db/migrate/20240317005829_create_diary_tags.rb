class CreateDiaryTags < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    # 同じタグは２度保存できないようにする
    add_index :diary_tags, :name, unique: true
  end
end
