Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"
  devise_for :users

  root to: 'places#home'
  resources :places do
    resources :bookings
  end

  namespace :owner do
    resources :places
    resources :bookings
  end

  resources :bookings



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
