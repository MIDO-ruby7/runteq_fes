Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[index show edit update]
end
