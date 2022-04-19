Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :albums
  root "home#index"


  delete "images/:id/purge", to: "albums#purge", as: "purge_image"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
