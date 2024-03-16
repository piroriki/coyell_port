class AddChildIdToSymptoms < ActiveRecord::Migration[7.0]
  def change
    add_column :symptoms, :child_id, :integer
  end
end
