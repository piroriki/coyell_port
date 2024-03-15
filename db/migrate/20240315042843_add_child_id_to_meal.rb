class AddChildIdToMeal < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :child_id, :integer
  end
end
