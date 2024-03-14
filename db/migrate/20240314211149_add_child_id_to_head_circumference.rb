class AddChildIdToHeadCircumference < ActiveRecord::Migration[7.0]
  def change
    add_column :head_circumferences, :child_id, :integer
  end
end
