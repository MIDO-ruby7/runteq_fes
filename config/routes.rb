Rails.application.routes.draw do
  root to: 'static_pages#top'
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get 'login', to: 'oauths#login', as: :login
  delete 'logout', to: 'oauths#destroy', as: :logout

  resources :users, only: %i[index show edit update]

  resources :posts, only: %i[index show] do
    resources :comments, only: %i[create edit update destroy], shallow: true
  end

  namespace :admin do
    root to: 'base#top'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :posts, only: %i[index show new create edit update destroy] do
      collection { post :import }
    end
    resources :users, only: %i[index edit update destroy]
    resources :categories, only: %i[index new create edit update destroy]
  end
end
