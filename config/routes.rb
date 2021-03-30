Rails.application.routes.draw do
  resources :working_places
  devise_for :users
  devise_scope :user do
  root :to => "devise/sessions#new"
  end
  resources :attendances
  resources :users, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
