Rails.application.routes.draw do
  
  # 管理者用
  namespace :admin do
    devise_scope :user do
      get "signup",      to: "users/registrations#new"
      get "login",       to: "users/sessions#new"
      delete "logout",   to: "users/sessions#destroy"
      #resources :dashboard, only: [:index]
      root to: "dashboard#index"
    end
  end
  
  # ユーザー用
  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions:      "users/sessions",
    passwords:     "users/passwords"
   }
  devise_scope :user do # devise提供の独自ルーティング
    get "signup",        to: "users/registrations#new"
    get "login",         to: "users/sessions#new"
    delete "logout",     to: "users/sessions#destroy"
    get "edit_user",     to: "users/registrations#edit"
    # ゲストログイン用
    post "guest_login",  to: "users/sessions#guest_login"
    # ユーザープロフィール用
    get "users/:id/profile", to: "users#show", as: "user_profile"
  end

  resources :child

  # トップページをホーム画面に設定
  root to: 'homes#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
