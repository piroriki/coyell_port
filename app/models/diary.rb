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

  # タグ保存用
  def save_tags(tags)
    tags.each do |new_tag|
      # selfはこの場合、@diaryにあたる
      # 中間テーブルを介して保存されるようにする
      self.tags.find_or_create_by(name: new_tags)
    end
  end

  # タグ上書き用
  def update_tags(latest_tags)
    if self.tags.empty?
      # 既存のタグになければ追加する
      latest_tags.each do |latest_tag|
        self.tags.find_or_create_by(name: latest_tag)
      end
    elsif latest_tags.empty?
      # 更新対象のタグがなければ、既存のタグを全て削除
      # 既に保存されていたら、登録されているタグの内容を削除
      self.tags.each do |tag|
        self.tags.delete(tag)
      end
    else
      # 既存のタグ、更新すべきタグの双方がある場合は、差分のみ更新する
      current_tag = self.tags.pluck(:name)
      # 左辺を起点に引き算をする
      old_tags = current_tags - latest_tags
      # 一致したもののみ新規タグとして取得する
      new_tags = latest_tags  - current_tags
      # 既存のタグは削除する
      old_tags.each do |old_tag|
        tag = self.tags.find_by(name: old_tag)
        self.tags.delete(tag) if tag_present?
      end

      new_tags.each do |new_tag|
        self.tags.find_or_create_by(name: new_tag)
      end
    end
  end
end
