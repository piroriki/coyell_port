Rails.application.routes.draw do
  get 'temperatures/new'
  get 'temperatures/edit'
  get 'temperatures/show'

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
    get    "signup",      to: "users/registrations#new"
    get    "login",       to: "users/sessions#new"
    post   "login",       to: "users/sessions#create"
    delete "logout",      to: "users/sessions#destroy"
    # プロフィール編集用
    #get    "edit_user",   to: "users/registrations#edit"
    #patch  "edit_user",   to: "users/registrations#update"
    #put    "edit_user",   to: "users/registrations#update"
    # ゲストログイン用
    post   "guest_login", to: "users/sessions#guest_login"
    # ユーザープロフィール用
    get    "users/show",  to: "users#show", as: "user_profile"
  end

  # 子供関連のモデルをネストする
  resources :children do
    resources :heights, :weights, :pees
  end

  # トップページをホーム画面に設定
  root to: "homes#top"

  # 複数モデルを一つのビューに表示
  get "record", to: "homes#record"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
