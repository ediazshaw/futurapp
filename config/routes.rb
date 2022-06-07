Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "profile", to: "entries#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries, only: [:create, :index, :new, :show] do
    resources :reviews, only: [ :create ]
  end
  get "/search", to: "entries#search", as: :search

  get "/forum", to: "entries#forum", as: :forum
  get "forum/:id", to: "entries#forum_show", as: :forum_theme

  require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  # end

end
