Rails.application.routes.draw do
  resources :images
  root 'books#index'
  resources :categories
  resources :authors
  resources :books do
    resources :reviews
  end

  devise_for :users
  namespace :admin do
    root 'books#index'
    resources :authors
    # resources :users, only: [:index]
    # put '/users/:id', to: 'users#activate', as: 'user'
    resources :books, only: [:index, :destroy]
    put '/books/:id', to: 'books#activate'
    resources :categories
  end
end
