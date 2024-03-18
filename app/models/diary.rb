class Diary < ApplicationRecord

  # PhotoUploaderクラスとphotoカラムを紐づける
  mount_uploader :photo, PhotoUploader
  
  # childモデルとの関連づけ
  belongs_to :child

  # diary_tagモデルとの関連づけを、リレーションを介して行う
  has_many :diary_tag_relations, dependent: :destroy
  has_many :diary_tags, through: :diary_tag_relations

  # バリデーション
  validates :content, presence: true, length: { maximum: 5000 }

end
