Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create, :edit, :update,  :destroy]
  resources :companies, only: [:index, :show, :new, :create, :edit, :update,  :destroy]
  resources :users, only: [:new, :create]
  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session', to: 'sessions#destroy'
end
