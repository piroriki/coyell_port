class ChatRoom < ApplicationRecord

  # チャットルーム、チャット用中間テーブルとの関連づけ
  has_many :chats, dependent: :destroy
  has_many :user_room_relations # 1つのルームにユーザー2人が入るため、複数形になる

end
