class AddChildIdToBaths < ActiveRecord::Migration[7.0]
  def change
    add_column :baths, :child_id, :integer
  end
end
