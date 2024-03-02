Rails.application.routes.draw do
  
  # 管理者用
  namespace :admins do
    devise_scope :user do
      get "signup",      to: "registrations#new"
      get "login",       to: "sessions#new"
      delete "logout",   to: "sessions#destroy"
      root to: "dashboard#index"
    end
  end
  
  # ユーザー用
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords"
   }

  devise_scope :user do # devise提供の独自ルーティング
    get "signup",        to: "registrations#new"
    get "login",         to: "sessions#new"
    delete "logout",     to: "sessions#destroy"
    # ゲストログイン用ルーティング設定
    post "guest_login",  to: "sessions#guest_login"
  end

  # トップページをホーム画面に設定
  root to: 'homes#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
