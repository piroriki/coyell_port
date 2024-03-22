class Entry < ApplicationRecord

  # チャットルーム、ユーザーとの関連づけ
  # 中間テーブルのため、1:1の関連づけになる
  belongs_to :user
  belongs_to :room

end
