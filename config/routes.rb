Rails.application.routes.draw do
  root to: "students#index"
  resources :students
  get 'search', to:"students#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
