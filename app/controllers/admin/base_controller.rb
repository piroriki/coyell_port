class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  
  layout "admin"

  private

    # 管理者権限が付与されたユーザーのみ、管理機能を使用できるようにする
    def check_admin
      redirect_to root_path unless current_user.admin?
    end
end