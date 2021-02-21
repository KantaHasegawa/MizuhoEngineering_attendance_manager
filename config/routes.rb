Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/show'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
