Rails.application.routes.draw do
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
  resources :recipe_types
  resources :cuisines
end
