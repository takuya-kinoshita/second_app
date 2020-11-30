Rails.application.routes.draw do
  get 'users/new'
  get '/help', to: "static_pages#help", as: 'helf'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/login", to: "static_pages#login"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/index", to: "users#index"

  post "/signup", to: "users#create"
  resources :users

end
