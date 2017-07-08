Rails.application.routes.draw do
  root 'books#index'

  resources :authors
  resources :books
  resources :categories

  namespace :admin do
    root 'books#index'
    resources :books
    resources :categories
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
