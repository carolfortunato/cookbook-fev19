Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    collection do
      get 'search'
      get 'show_all'
    end
    member do
      post 'favorite'
      delete 'favorite', to: 'recipes#unfavorite'
    end
  end
  get 'my_recipes', to:'recipes#my_recipes'
  resources :recipe_types
  resources :cuisines
  resources :lists
end
