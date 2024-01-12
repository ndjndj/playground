Rails.application.routes.draw do
  namespace :api do
    namespace :users do
      get "", to: "users#index"
      post "", to: "users#create"


    end
    #resources :users, only: [:index, :create, :update, :delete]
  end
end
