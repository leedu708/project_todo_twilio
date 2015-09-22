Rails.application.routes.draw do
  
  root "todos#home"

  resources :todos

  get "/home", to: "todos#home"

end
