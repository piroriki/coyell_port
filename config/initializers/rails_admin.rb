RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

   # 管理画面にアクセスする前に、:userスコープのユーザーを認証する
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == "foo" && password == "bar"
    end
    #warden.authenticate! scope: :user
  end

  #rails_adminでcurrent_userを使用するための設定 
  config.current_user_method(&:current_user)

  # rails_adminのアクセス制限に、cancancanを使用するための設定
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
