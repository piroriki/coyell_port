class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済みユーザーのみアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後、子供一覧画面に遷移
  def after_sign_in_path_for(resource)
    children_path
  end

  private
  
    def configure_permitted_parameters
      # 管理者用カラムの許可を追加
      # ログイン用
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
      # ユーザー情報変更用
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
    end
end
