Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "discover", to: 'pages#discover', as: :discover

  resources :users do
  resources :likes, except: [:edit, :update]
    # resources :likes, except: [:edit, :update]
    resources :matches, except: [:edit, :update]
  end
  resources :messages, except: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
