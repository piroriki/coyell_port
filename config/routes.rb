Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/e', as: 'rails_admin'

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
    patch  "users/edit",  to: "users/registrations#update"
    #put    "edit_user",   to: "users/registrations#update"
    # ゲストログイン用
    post   "guest_login", to: "users/sessions#guest_login"
    # ユーザープロフィール用
    get    "users/:id",  to: "users#show", as: "user_profile"
  end

  # 子供関連のモデルをネストする
  resources :children do
    resources :heights, :weights, :pees, :temperatures, :head_circumferences, :meals, :poops, :milks, :right_breast_milks, :left_breast_milks, :symptoms, :baths, :execretions, :diaries
  end

  # トップページをホーム画面に設定
  root to: "homes#top"

  # 複数モデルを一つのビューに表示
  get "record", to: "homes#record"

  # タグ検索用
  get "search_tag", to: "diaries#search_tag"

  # チャット用
  resources :direct_messages, only: [:show, :create, :destroy]
 
  #resources :rooms

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
