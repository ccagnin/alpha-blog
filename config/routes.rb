Rails.application.routes.draw do
  root "main#index" 
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
