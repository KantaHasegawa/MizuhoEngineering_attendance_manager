Rails.application.routes.draw do
  resources :working_places
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  devise_scope :user do
  root :to => "devise/sessions#new"
  get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
  match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end
  resources :attendances
  resources :users, only: %i[index show]
  resources :users do
  member do
    get 'table'
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
