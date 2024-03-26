class CreateStudyAidBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :study_aid_books do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :image, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :study_aid_books, :title, unique: true
  end
end
