class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 子供との関連づけ
  has_many :children

  # ゲストログイン機能のメソッドをモデルで設定することで、
  # コントローラ内のコードが見やすくなる
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64 # パスワードはランダムな文字列で作成
      user.name = "ゲスト"
      user.skip_confirmation! #confirmable使用のため
    end
  end
end
