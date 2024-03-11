class AddChildIdToWeight < ActiveRecord::Migration[7.0]
  def change
    add_column :weights, :child_id, :integer
  end
end
