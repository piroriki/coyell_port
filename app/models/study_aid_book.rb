class StudyAidBook < ApplicationRecord

  # バリデーション追加
  validates :title,   length: { maximum: 50 }
  validates :content, length: { maximum: 10000 }
end
