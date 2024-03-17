class DiaryTag < ApplicationRecord

  # diaryモデルとの関連づけを、リレーションを介して行う
  has_many :post_diary_tags, dependent: :destroy
  has_many :diaries, through: :post_diary_tags

  # バリデーション
  validates :name, presence: true, length: { maximum:50 }
end
