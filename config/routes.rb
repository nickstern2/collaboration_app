Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users do
  resources :likes, except: [:edit, :update]
    # resources :likes, except: [:edit, :update]
  resources :matches, except: [:edit, :update]
  # resources :profiles, except: [:index]
  end
  resources :messages, except: [:edit, :update]
  post 'user/:id/like', to: 'likes#like_user'
  post 'user/:id/dislike', to: 'likes#dislikelike_user'
end
