class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  private

    def configure_permitted_parameters
      # 管理者用カラムの許可を追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end
end
