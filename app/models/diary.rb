class Diary < ApplicationRecord

  # PhotoUploaderクラスとphotoカラムを紐づける
  mount_uploader :photo, PhotoUploader
  
  # childモデルとの関連づけ
  belongs_to :child

  # diary_tagモデルとの関連づけを、リレーションを介して行う
  has_many :diary_tag_relations, dependent: :destroy
  has_many :diary_tags, through: :diary_tag_relations
  # diary_tag_relationモデルも、同時に削除されるように設定
  accepts_nested_attributes_for :diary_tag_relations, allow_destroy: true 

  # バリデーション
  validates :content, presence: true, length: { maximum: 5000 }
  
  # タグ保存用
  def save_diary_tags(tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.diary_tags.pluck(:name) unless self.diary_tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.diary_tags.delete DiaryTag.find_by(name: old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      diary_tag = DiaryTag.find_or_create_by(name: new_name)
      self.diary_tags << diary_tag
    end
  end
end
