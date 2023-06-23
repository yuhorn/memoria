Rails.application.routes.draw do
  get 'users/show'
  get 'albums/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "albums#index"
  resources :albums do
    resources :photos, only: [:new, :create, :index, :destroy]
  end
end