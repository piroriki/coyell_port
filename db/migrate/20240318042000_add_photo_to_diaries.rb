class AddPhotoToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :photo, :string
  end
end
