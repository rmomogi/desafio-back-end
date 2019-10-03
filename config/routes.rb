require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'uploads#index'

  resources :uploads, only: %i[index]
  resources :cnabs, only: %i[new create]

  mount Sidekiq::Web => '/sidekiq'
end
