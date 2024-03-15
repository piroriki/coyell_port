class AddChildIdToLeftBreastMilks < ActiveRecord::Migration[7.0]
  def change
    add_column :left_breast_milks, :child_id, :integer
  end
end
