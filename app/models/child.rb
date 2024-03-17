class Child < ApplicationRecord

  # 家族ユーザーとの関連づけ
  belongs_to :user

  # 各種モデルとの関連づけ
  has_many :heights,             dependent: :destroy
  has_many :weights,             dependent: :destroy
  has_many :pees,                dependent: :destroy
  has_many :poops,               dependent: :destroy
  has_many :temperatures,        dependent: :destroy
  has_many :head_circumferences, dependent: :destroy
  has_many :meals,               dependent: :destroy
  has_many :milks,               dependent: :destroy
  has_many :right_breast_milks,  dependent: :destroy
  has_many :left_breast_milks,   dependent: :destroy
  has_many :symptoms,            dependent: :destroy
  has_many :baths,               dependent: :destroy

  # 性別の分類をあらかじめセットしておく
  enum gender: { other: 0, male: 1, female: 2 }

end
