Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  root "groups#index"
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
