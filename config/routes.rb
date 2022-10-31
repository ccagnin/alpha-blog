Rails.application.routes.draw do
  root "main#index" 
  resources :articles
end
