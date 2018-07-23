Rails.application.routes.draw do
  resources :vehicles
  resources :spaces
  devise_for :users, controllers: { registrations: "registrations" }
	root to: 'home#index'
  resources :reservations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
end
