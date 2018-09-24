Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create_guest'
  get 'sessions/create'
  get 'sessions/destroy'
  root "health_pages#search"

  resources :users

  get "search" => "health_pages#search"
  get "results" => "health_pages#results"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
