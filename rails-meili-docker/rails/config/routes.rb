Rails.application.routes.draw do
  namespace :api do
    namespace :users do
      get "", to: "users#index"
      post "", to: "users#create"
      patch ":id", to: "users#update"
      delete ":id", to: "users#delete"
    end
  end
end
