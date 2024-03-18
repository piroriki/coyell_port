class CreateDiaryTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :diary_tag_relations do |t|
      # 外部キー設定を追加
      t.references :diary,              null: false, foreign_key: true
      t.references :diary_tag,          null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグは２度保存できないようにする
    #add_index :post_diary_tags, [:diary_tag_id], unique: true
  end
end