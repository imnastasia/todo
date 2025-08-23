Rails.application.routes.draw do
  root 'lists#index'

  resource :session
  resources :passwords, param: :token

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :lists
end
