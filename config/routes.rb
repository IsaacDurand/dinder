Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :dishes, only: [:index, :new, :create]
  resources :products, only: [:index, :create]
  resources :units, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
