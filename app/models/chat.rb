class Chat < ApplicationRecord

  # ユーザー、チャットルームとの関連づけ
  belongs_to :user
  belongs_to :chat_room

  # バリデーション
  validates :message, presence: true

end
