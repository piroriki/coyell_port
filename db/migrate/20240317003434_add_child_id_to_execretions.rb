class AddChildIdToExecretions < ActiveRecord::Migration[7.0]
  def change
    add_column :execretions, :child_id, :integer
  end
end
