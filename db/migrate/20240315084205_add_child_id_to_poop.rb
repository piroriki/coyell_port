class AddChildIdToPoop < ActiveRecord::Migration[7.0]
  def change
    add_column :poops, :child_id, :integer
  end
end
