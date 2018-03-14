Rails.application.routes.draw do
  get 'tree/' => 'tree#index'
  get 'tree/data', :defaults => { :format => 'json' }
  get 'tree/jcitags', :defaults => { :format => 'json' }
  get 'tree/tycotags', :defaults => { :format => 'json' }
  get 'tree/jcimap', :defaults => { :format => 'json' }
  get 'tree/tycomap', :defaults => { :format => 'json' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  get  '/webfootprint', to: 'pages#webfootprint'
  get  '/contentmapping', to: 'pages#contentmapping'
  get  '/home', to: 'pages#home'
  get  '/flows', to: 'pages#flows'
  get  '/flowdetail/:id', to: 'pages#flowdetail', as: 'flowdetail'
  get  '/templates', to: 'pages#templates'
  get  '/sitemap', to: 'pages#sitemap'

  get  '/sitemapdetail/:id', to: 'pages#sitemapdetail', as: 'sitemapdetail'
  get  '/taxonomy', to: 'pages#taxonomy'
  get  '/taxonomysite/:id', to: 'pages#taxonomysite', as: 'taxonomysite'
  # get '/taxonomysite/:id/data', to:'pages#taxonomysite', as: 'taxonomysite/data', :defaults => { :format => 'json' }
  get '/page/:id', to: 'pages#page', as: 'page'
  get '/templatedetail/:id', to: 'pages#templatedetail', as: 'templatedetail'
  get '/templatelist/:id', to: 'pages#templatelist', as: 'templatelist'
  get '/api/v1/tag/data', :defaults => { :format => 'json' }

  #api
  namespace :api do
    namespace :v1 do
      # resources :sessions, only: [:create, :show]
      resources :tag, only: [:index, :create, :show, :update, :destroy] do
        post :activate, on: :collection
        # resource :feed, only: [:show]
      end
    end
  end

end
