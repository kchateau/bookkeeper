Rails.application.routes.draw do
  get 'home/index'
  devise_for :routes
  devise_for :users

  root to: "home#index"

  resource :books, only: [:new, :create] 
end
