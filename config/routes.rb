Rails.application.routes.draw do
  get '/categories', to: 'pages#categories'

  resources :postal_codes, only: %i[index]
end
