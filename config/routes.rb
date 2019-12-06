Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  # , path_names: {
  #   sign_in: 'login',
  #   sign_up: 'joinus',
  #   sign_out: 'logout'
  # }
  resources :books, only: [:show, :index]
  resources :categories
  resources :reviews
  get 'home/index'
  # devise_for :users
  resources :books do
    resources :reviews
  end
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
