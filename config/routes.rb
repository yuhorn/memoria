Rails.application.routes.draw do
  get 'albums/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "albums#index"
end
