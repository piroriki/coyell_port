class AddChildIdToPee < ActiveRecord::Migration[7.0]
  def change
    add_column :pees, :child_id, :integer
  end
end
