class Child < ApplicationRecord

  # 性別の分類をあらかじめセットしておく
  enum role: [:male, :female, :other]
  
end
