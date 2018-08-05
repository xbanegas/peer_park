require 'sidekiq/web'
Rails.application.routes.draw do
  resources :vehicles
  resources :spaces
  devise_for :users, controllers: { registrations: "registrations" }
	root to: 'home#index'
	resources :reservations
	authenticate :user, lambda { |u| u.admin? } do
		mount Sidekiq::Web => '/sidekiq'
	end
end
