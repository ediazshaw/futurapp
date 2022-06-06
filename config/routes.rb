Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: "entries#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries, only: [:create, :index, :new, :show]
  get "/search", to: "entries#search", as: :search
  require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  # end
end
