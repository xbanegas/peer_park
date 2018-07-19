Rails.application.routes.draw do
  resources :reservations
  resources :spots
  resources :users
end
