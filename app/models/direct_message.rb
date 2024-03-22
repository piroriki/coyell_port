class DirectMessage < ApplicationRecord

  # ユーザー、チャットルームとの関連づけ
  belongs_to :user
  belongs_to :room

  # データが作成されたら、非同期でブロードキャスト処理を実行させる
  after_create_commit { ChatBroadcastJob.perform_later self }

  # バリデーション
  validates :message, presence: true

end
