Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :households, only: [:create, :show, :update, :destroy]
      resources :users, only: [:create, :show, :update, :destroy] do
        resources :expenses, only: [:index]
        resources :payments
      end
      post '/login', to: 'users#login'
      get '/current_user', to: 'users#get_current_user'
    end
  end

end
