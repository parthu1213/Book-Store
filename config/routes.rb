Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  devise_for :users, controllers: {
                      sessions:      'users/sessions',
                      registrations: 'users/registrations',
                      passwords:     'users/passwords',
                      confirmations: 'users/confirmations'
                    }

  resources :books, only: [:show, :index]
  resources :categories
  resources :reviews
  resources :orders
  get 'home/index'
  # devise_for :users
  resources :books do
    resources :reviews
  end
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
