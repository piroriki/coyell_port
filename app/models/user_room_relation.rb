class UserRoomRelation < ApplicationRecord

  # チャットルーム、ユーザーとの関連づけ
  belongs_to :user
  belongs_to :chat_room

end
