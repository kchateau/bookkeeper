Rails.application.routes.draw do
  get 'home/index'
  get 'home/search', to: 'home#search'

  devise_for :routes
  devise_for :users

  root to: "home#index"

  resource :books, only: [:new, :create, :destroy] do
    member do
      get 'search'
      post 'shelf'
      post 'search_results'
    end
  end
end
