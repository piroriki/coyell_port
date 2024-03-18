class AddTitleToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :title, :string
  end
end
