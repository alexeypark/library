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
    resources :books
    resources :categories
  end
end
