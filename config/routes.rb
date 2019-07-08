Rails.application.routes.draw do

  post '/checkout' => 'paypal#checkout'
  post '/execute' =>  'paypal#execute'
  root 'paypal#index'

  namespace :api do
    namespace :v1 do
      resources :riders, only: [:create]
      resources :drivers, only: [:create]
      resources :bookings, only: [:create] do
        member do
          post :make_payment
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
