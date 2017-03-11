require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  #Api defination
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1 do
      resources :products
    end
  end


  scope module: 'admin' do
    resources :articles
  end
end
