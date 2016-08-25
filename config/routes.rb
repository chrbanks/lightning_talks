Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users
  end

  resources :meetings do
    resources :talks
  end

  get  'signin' => 'sessions#new'
  post 'saml/consume' => 'sessions#create'
  post 'sessions/create' => 'sessions#create'

  root 'meetings#index'
end
