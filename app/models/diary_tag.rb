class DiaryTag < ApplicationRecord

  # diaryモデルとの関連づけを、リレーションを介して行う
  has_many :diary_tag_relations, dependent: :destroy
  has_many :diaries, through: :diary_tag_relations, dependent: :destroy

  # バリデーション
  validates :name, presence: true, length: { maximum:50 }
end
