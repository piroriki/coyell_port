class Child < ApplicationRecord

  # 家族ユーザーとの関連づけ
  belongs_to :user

  # 各種モデルとの関連づけ
  has_many :heights
  has_many :weights
  has_many :pees
  has_many :poops
  has_many :temperatures
  has_many :head_circumferences
  has_many :meals
  has_many :milks
  has_many :right_breast_milks
  has_many :left_breast_milks
  has_many :symptoms

  # 性別の分類をあらかじめセットしておく
  enum gender: { other: 0, male: 1, female: 2 }

end
