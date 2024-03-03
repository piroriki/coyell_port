class Child < ApplicationRecord

  # 家族ユーザーとの関連づけ
  belongs_to :user

  # 性別の分類をあらかじめセットしておく
  enum gender: { other: 0, male: 1, female: 2 }

end
