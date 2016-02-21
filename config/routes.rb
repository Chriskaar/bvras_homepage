Rails.application.routes.draw do
  scope "/:locale" do
    resources :articles, only: [:index, :show]
    resources :inquiries 
    resources :pages, param: :permalink
    resources :users
    resources :departments
    resources :article_categories
    namespace :admin do
      resources :articles, only: [:new, :create, :edit, :destroy]
    end
    get 'contact'               => 'contact#index'
    get 'admin'                 => 'admin#index'
    get '/'                     => 'front#index'
    get 'articles/category/:id' => 'articles#category'
  end
  
  get 'users/sign_up'           => 'users#sign_up'
  devise_for :users, :controllers => {  :omniauth_callbacks => "callbacks",
                                        :sessions => 'users/sessions',
                                        }


  
  root to: 'front#index'

  get 'pages/:permalink', :controller => 'pages', :action => 'show'



end