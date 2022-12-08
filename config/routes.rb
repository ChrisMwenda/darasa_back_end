Rails.application.routes.draw do
  devise_for :students
  
  resources :teachers do
    collection do
      get 'search' 
    end
     
   resources :reviews, only: [:index, :show, :destroy, :create, :update]
   root 'movies#index' 
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
