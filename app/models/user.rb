class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # 現在のパスワードにアクセスできるようにする
  attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum で管理者権限の設定
  enum role: { non_admin: 0, admin: 1 }

  # 子供との関連づけ
  has_many :children, dependent: :destroy

  # チャット用中間テーブル、チャットとの関連付け
  has_many :rooms,               through:   :entries
  has_many :entries,             dependent: :destroy
  has_many :direct_messages,     dependent: :destroy

  # 各種バリデーション
  # create時点のみバリデーションが動作するように追加設定
  validates :password, presence: true, on: :create

  # ゲストログイン機能のメソッドをモデルで設定することで、
  # コントローラ内のコードが見やすくなる
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64 # パスワードはランダムな文字列で作成
      user.name = "ゲスト"
      #user.skip_confirmation! #confirmable使用のため
    end
  end
end
