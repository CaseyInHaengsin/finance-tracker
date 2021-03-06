Rails.application.routes.draw do

  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get 'portfolio', to: "users#portfolio"
  get 'search_stock', to: 'stocks#search'
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search'


end
