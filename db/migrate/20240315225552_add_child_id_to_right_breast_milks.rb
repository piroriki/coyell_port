class AddChildIdToRightBreastMilks < ActiveRecord::Migration[7.0]
  def change
    add_column :right_breast_milks, :child_id, :integer
  end
end
