Rails.application.routes.draw do

  resources :coffee_notes
  resources :coffee_note_forms
  
  get 'home/index'

  root 'home#index'

end
