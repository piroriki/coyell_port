class PostDiaryTag < ApplicationRecord
  
  # diary,diary_tagモデルとの関連づけ
  belongs_to :diary
  belongs_to :diary_tag

end
