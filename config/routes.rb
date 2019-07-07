Rails.application.routes.draw do

  post '/checkout' => 'paypal#checkout'
  post '/execute' =>  'paypal#execute'
  get '/bookings' => 'bookings#index'
  post '/make_payment' => 'bookings#make_payment'
  root 'paypal#index'

  namespace :api do
	  namespace :v1 do
	   resources :rider
	  end
	 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
