Rails.application.routes.draw do
 resources :cities

  root to: 'visitors#index'
  get '/all_users', to: 'users#index', as: 'users'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, except: :index
end
