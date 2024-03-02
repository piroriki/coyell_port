Rails.application.routes.draw do
  devise_for :users

  # トップページをホーム画面に設定
  root to: 'homes#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
