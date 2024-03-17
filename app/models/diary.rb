class Diary < ApplicationRecord
  
  # childモデルとの関連づけ
  belongs_to :child

  # diary_tagモデルとの関連づけを、リレーションを介して行う
  has_many :post_diary_tags, dependent: :destroy
  has_many :diary_tags, through: :post_diary_tags

  # バリデーション
  validates :content, presence: true, length: { maximum: 5000 }

end
