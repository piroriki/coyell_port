class Symptom < ApplicationRecord

  # childモデルとの関連づけ
  belongs_to :child

  # 症状の分類をセットしておく
  enum kinds: { fever: 0, snot: 1, cough: 2, vomit: 3, rash: 4, injury: 5, other: 6 }

end
