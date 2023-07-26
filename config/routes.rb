Rails.application.routes.draw do
  root to: 'static_pages#top'
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get 'login', to: 'oauths#login', as: :login
  delete 'logout', to: 'oauths#destroy', as: :logout

  resources :users, only: %i[index show edit update]
end
