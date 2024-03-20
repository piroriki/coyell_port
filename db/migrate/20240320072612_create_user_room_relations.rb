class CreateUserRoomRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_room_relations do |t|
      t.references :user, null: false, foregin_key: true
      t.references :room, null: false, foregin_key: true

      t.timestamps
    end
  end
end
