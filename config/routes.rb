Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#show", page: "home"

  get  '/component/:id', to: 'pages#component', as: 'component'
  get  '/components/', to: 'pages#components', as: 'components'
  get  '/contentmapping', to: 'pages#contentmapping'
  get  '/home', to: 'pages#home'
  get  '/flows', to: 'pages#flows'
  get  '/flowdetail/:id', to: 'pages#flowdetail', as: 'flowdetail'
  get  '/iframe', to: 'pages#iframe', as: 'iframe'
  get  '/legacysites', to: 'pages#legacysites'
  get  '/legacysitedetail/:id', to: 'pages#legacysitedetail', as: 'legacysitedetail'
  get  '/messaging', to: 'pages#messaging'
  get  '/messagingdetail/:id', to: 'pages#messagingdetail', as: 'messagingdetail'
  get  '/personachart/', to: 'pages#personachart', as: 'personachart'
  get  '/page/:id', to: 'pages#page', as: 'page'
  get   "/pages/:page" => "pages#show"
  get  '/searchtest', to: 'pages#searchtest'
  resources :search, only: [:index]
  resources :site_crawl
  get  '/sitemap', to: 'pages#sitemap'
  get  '/sitemapdetail/:id', to: 'pages#sitemapdetail', as: 'sitemapdetail'
  resources :sitepage
  get  '/smart_listing/' => 'smart_listing#index'
  get  '/taxonomy', to: 'pages#taxonomy'
  get  '/taxonomysite/:id', to: 'pages#taxonomysite', as: 'taxonomysite'
  get  '/templates', to: 'pages#templates'
  get  '/templatedetail/:id', to: 'pages#templatedetail', as: 'templatedetail'
  get  '/templatelist/:id', to: 'pages#templatelist', as: 'templatelist'
  resources :text_item
  get 'tree/' => 'tree#index'
  get 'tree/data', :defaults => { :format => 'json' }
  get 'tree/jcitags', :defaults => { :format => 'json' }
  get 'tree/tycotags', :defaults => { :format => 'json' }
  get 'tree/jcimap', :defaults => { :format => 'json' }
  get 'tree/tycomap', :defaults => { :format => 'json' }
  get  '/api/v1/tag/data', :defaults => { :format => 'json' }
  get  '/webfootprint', to: 'pages#webfootprint'
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
