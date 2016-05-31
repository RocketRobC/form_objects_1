Rails.application.routes.draw do

  resources :coffee_notes

  get 'home/index'

  root 'home#index'

end
