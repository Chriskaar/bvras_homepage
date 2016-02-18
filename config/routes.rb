Rails.application.routes.draw do
  scope "/:locale" do
    resources :articles, only: [:index, :show]
    resources :pages, param: :permalink
    resources :users
    
    get 'contact'           => 'contact#index'
    get 'admin'             => 'admin#index'
    get '/'                 => 'front#index'
  end
  
  get 'users/sign_up'           => 'users#sign_up'
  devise_for :users, :controllers => {  :omniauth_callbacks => "callbacks",
                                        :sessions => 'users/sessions',
                                        }


  
  root to: 'front#index'

  get 'pages/:permalink', :controller => 'pages', :action => 'show'

  namespace :admin do
    resources :articles, only: [:new, :create, :edit, :destroy]
  end

end