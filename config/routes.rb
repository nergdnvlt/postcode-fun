Rails.application.routes.draw do
  resources :postal_codes, only: %i[index]
end
