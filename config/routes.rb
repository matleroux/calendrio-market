Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'places#home'
  resources :places do
    resources :bookings
  end

  namespace :owner do
    resources :places
    resources :bookings
  end

  resources :bookings, only: [:index, :show, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
