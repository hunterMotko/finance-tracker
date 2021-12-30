Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :stocks, only: [:index]
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'assets', to: 'crypto#assets'
end
