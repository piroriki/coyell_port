class AddChildIdToTemperature < ActiveRecord::Migration[7.0]
  def change
    add_column :temperatures, :child_id, :integer
  end
end
