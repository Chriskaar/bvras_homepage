Rails.application.routes.draw do
  scope "/:locale" do
    get 'tags/:tag', to: 'articles#index', as: :tag
    get 'articles/category/:category', to: 'articles#index', as: :article_category
    resources :articles, param: :permalink, only: [:index, :show]
    resources :inquiries, only: [:create]
    resources :pages, param: :permalink, only: [:index, :show]
    resources :users, only: [:create, :registration, :sessions, :passwords]
    namespace :admin do
      resources :departments
      resources :inquiries 
      resources :pages, param: :permalink
      resources :articles, param: :permalink
      resources :categories, only: [:new, :create, :edit, :destroy]
      resources :users
      match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user
      root to: 'admin#index'
      
    end
    get 'contact'               => 'contact#index'
    get '/'                     => 'front#index'
    get 'articles/category/:id' => 'articles#category'
  end
  
  get 'users/sign_up'           => 'users#sign_up'
  devise_for :users, :controllers => {  :omniauth_callbacks => "callbacks",
                                        :sessions => 'users/sessions',
                                        }

  
  root to: 'front#index'



end