Rails.application.routes.draw do

  resources :coffee_notes
  resources :coffee_types

  get 'home/index'

  root 'home#index'

end
