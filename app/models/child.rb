class Child < ApplicationRecord

  # 家族ユーザーとの関連づけ
  belongs_to :user

  # 性別の分類をあらかじめセットしておく
  enum role: [:male, :female, :other]

end
