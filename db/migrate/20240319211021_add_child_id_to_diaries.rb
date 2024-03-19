class AddChildIdToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :child_id, :integer
  end
end
