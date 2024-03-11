class AddChildIdToHeight < ActiveRecord::Migration[7.0]
  def change
    add_column :heights, :child_id, :integer
  end
end
