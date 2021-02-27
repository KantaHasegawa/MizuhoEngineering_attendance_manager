Rails.application.routes.draw do
  get 'static_pages/index'
  devise_for :users
  root 'static_pages#index'
  resources :attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
