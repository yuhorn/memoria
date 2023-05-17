Rails.application.routes.draw do
  get 'albums/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "albums#index"
  resources :albums, only: [:index, :new, :create, :show, :edit, :update] do
    resources :photos, only: [:new, :create, :destroy]
  end
end