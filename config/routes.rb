Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :households, only: [:create, :show, :update, :destroy]
      resources :users
      resources :expenses
      resources :payments
    end
  end
end
