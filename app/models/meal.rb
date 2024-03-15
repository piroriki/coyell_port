class Meal < ApplicationRecord

    # childモデルとの関連づけ
    belongs_to :child

    # ご飯の分類をセットしておく
    enum kinds: { meal: 0, snack: 1, drink: 2 }

end
