class AddChildIdToMilks < ActiveRecord::Migration[7.0]
  def change
    add_column :milks, :child_id, :integer
  end
end
