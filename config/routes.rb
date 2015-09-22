Rails.application.routes.draw do
  
  root "todos#home"

  resources :todos
  get "/home", to: "todos#home"

  post "todos/:id/complete" => "todos#complete", as: :complete

  get "todos/send_text/:id" => "texts#send_text", as: :send_text

end
