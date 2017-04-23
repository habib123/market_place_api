require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  #Api defination
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users do
        resource :products, only: [:create, :update, :destroy]
        resources :orders, :only => [:index, :show, :create]
      end
      resources :sessions
      resources :products, only: [:index, :show]
    end
  end
end
