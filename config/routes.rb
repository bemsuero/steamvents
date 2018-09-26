Rails.application.routes.draw do
  root "health_pages#about"

  resources :users
  resources :posts

  get 'sessions/new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'
  delete 'sessions/guest_logout' => 'sessions#destroy_guest'

  get "post/:slug" => "posts#show"

  get "search" => "health_pages#search"
  get "results" => "health_pages#results"
  get "help" => "health_pages#help"
  get "about" => "health_pages#about"
  get "location" => "health_pages#location"
  get "locationresults" => "health_pages#locationresults"

  get "guest_users" => "users#create_guest_users"
  post "guest_users" => "users#create_guest_users"
  get "posts" => "users#_posts"
  get "index" => "users#_index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
