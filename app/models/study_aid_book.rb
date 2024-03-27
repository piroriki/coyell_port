class StudyAidBook < ApplicationRecord

  # ユーザーとの関連づけ
  belongs_to :user

  # ImageUploaderクラスとimageカラムを紐づける
  mount_uploader :image, ImageUploader
  

  # バリデーション追加
  validates :title,   length: { maximum: 50 }
  validates :content, length: { maximum: 10000 }
end
