Rails.application.routes.draw do
  resources :groups, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:edit, :update]
  devise_for :users
  root "messages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
