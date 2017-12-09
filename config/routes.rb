Rails.application.routes.draw do
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:edit, :update]
  resources :messages, only: [:index]
  devise_for :users
  root "groups#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
