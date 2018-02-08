Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'index#index'
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  get  '/home', to: 'pages#home'
  get  '/flows', to: 'pages#flows'
  get  '/flowdetail/:id', to: 'pages#flowdetail', as: 'flowdetail'
  get  '/templates', to: 'pages#templates'
  get  '/sitemap', to: 'pages#sitemap'
  get  '/sitemapdetail/:id', to: 'pages#sitemapdetail', as: 'sitemapdetail'
  get  '/taxonomy', to: 'pages#taxonomy'
  get  '/taxonomysite/:id', to: 'pages#taxonomysite', as: 'taxonomysite'
  get '/page/:id', to: 'pages#page', as: 'page'
  get '/templatedetail/:id', to: 'pages#templatedetail', as: 'templatedetail'
  get '/templatelist/:id', to: 'pages#templatelist', as: 'templatelist'



end
