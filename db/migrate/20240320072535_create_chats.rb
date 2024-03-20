class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :user,      null: false, foregin_key: true
      t.references :chat_room, null: false, foregin_key: true
      t.string :message

      t.timestamps
    end
  end
end
