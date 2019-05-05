require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :users, except: [:destroy]

  get :healthcheck, to: proc { [200, {}, ['Helthy']] }
end
