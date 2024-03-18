class PostDiaryTag < ApplicationRecord
  
  # diary,diary_tagモデルとの関連づけ
  belongs_to :diary
  belongs_to :diary_tag

  # バリデーション
  validates :diary_id,     presence: true
  validates :diary_tag_id, presence: true
end
