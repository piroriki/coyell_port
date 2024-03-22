class CreateDirectMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_messages do |t|
      t.references :user,      null: false, foregin_key: true
      t.references :room,      null: false, foregin_key: true
      t.string :message

      t.timestamps
    end
  end
end
