require "api_constraints"
Rails.application.routes.draw do
  use_doorkeeper
  # devise_for :users

  namespace :api, defaults: {format: "json"} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :posts
      
      namespace :auth do
        resources :users, only: [:create, :update, :show, :edit]
        put "confirm", to: "users#update"
        post "facebook", to: "facebook#facebook"
        post "sign_in", to: "sessions#create"
        post "sign_out", to: "logout#revoke"
        put "send_reset_password_token", to: "send_reset_password_token#update"
        put "validate_reset_password_token", to: "reset_password#validate_token"
        put "reset_password", to: "reset_password#update"
        put "change_password", to: "change_password#update"
      end
    end
  end
end
