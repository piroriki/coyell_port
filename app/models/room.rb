class Room < ApplicationRecord

  # チャットルーム、チャット用中間テーブルとの関連づけ
  has_many :direct_messages,     dependent: :destroy
  # 1つのルームにユーザー2人が入るため、複数形になる
  has_many :users,               through:   :entries
  has_many :entries,             dependent: :destroy 
end
