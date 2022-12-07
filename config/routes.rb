Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :destroy, :create, :update]
  resources :teachers, only: [:index, :show]
  resources :students,only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
