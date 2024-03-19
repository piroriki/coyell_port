class DiaryTag < ApplicationRecord

  # diaryモデルとの関連づけを、リレーションを介して行う
  has_many :diary_tag_relations, dependent: :destroy
  has_many :diaries, through: :diary_tag_relations, dependent: :destroy

  # バリデーション前に、タグを全て小文字化する
  before_validation :downcase_name

  # バリデーション
  validates :name, presence: true,uniqueness: { case_sensitive: false }, length: { maximum:50 }

  private

    def downcase_name
      self.name = name.downcase if name.present?
    end
end
