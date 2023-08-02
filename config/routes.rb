Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contacts#index"
  resources :contacts
  post 'search_address', to: 'contacts#search_address'
end
