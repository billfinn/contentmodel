Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'index#index'
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  get  '/home', to: 'pages#home'
  get  '/workflows', to: 'pages#workflows'
  get  '/site', to: 'pages#site'
  get  '/taxonomy', to: 'pages#taxonomy'
  get '/page/:id', to: 'pages#page', as: 'page'



end
