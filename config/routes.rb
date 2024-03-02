Rails.application.routes.draw do
  devise_for :users, :controllers => { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  namespace :admin do # 管理者アカウント用に"/admin"のルーティング追加
    devise_scope :user do # devise提供の独自ルーティング
      get "signup",      to: "registrations#new"
      get "login",       to: "sessions#new"
      delete "logout",   to: "sessions#destroy"
    end
  end

  # トップページをホーム画面に設定
  root to: 'homes#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
