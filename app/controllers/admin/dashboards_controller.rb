class Admin::DashboardsController < Admin::BaseController
  def index
    if current_user.admin? # 管理者だけユーザーの全データが表示されるようにする
      @users = User.all
    else
      @user = current_user
    end
  end
end
