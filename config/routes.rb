Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # get "discover", to: 'pages#discover', as: :discover

  get "users/:id/dislike_user", to: "users#dislike_user", as: :dislike_user
  put "users/:id/dislike_user", to: "users#dislike_user"

  resources :users do
  resources :likes, except: [:edit, :update]
    # resources :likes, except: [:edit, :update]
  resources :matches, except: [:edit, :update]
  # resources :profiles, except: [:index]
  end
  resources :messages, except: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
