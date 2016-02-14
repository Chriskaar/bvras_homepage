Rails.application.routes.draw do
	
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'admin' => 'admin#index'

  root to: 'front#index'




end