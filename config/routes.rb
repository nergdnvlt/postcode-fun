Rails.application.routes.draw do
  root to: 'pages#welcome'

  get '/categories', to: 'pages#categories'
  post 'small', to: 'pages#print_small'
  post 'alter', to: 'pages#alter'

  resources :postal_codes, only: %i[index]
end
