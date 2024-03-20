class ChatRoom < ApplicationRecord

  # チャットルーム、チャット用中間テーブルとの関連づけ
  has_many :chats,               dependent: :destroy
  # 1つのルームにユーザー2人が入るため、複数形になる
  has_many :users,               through: :user_room_relations
  has_many :user_room_relations, dependent: :destroy 
end
