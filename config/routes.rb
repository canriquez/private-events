Rails.application.routes.draw do

  resources :events, only: [:create, :new, :show, :index]
  root 'events#index'
  resources :users, only: [:create, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'invite', to: 'event_invitations#create'
  delete 'signout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
