Rails.application.routes.draw do
  devise_for :users
	root to: 'home#index'
  resources :reservations
  resources :spots
  resources :users
end
