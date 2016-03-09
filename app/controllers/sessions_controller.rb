class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if !user.admin 
    	redirect_to root_url
    else 
    	redirect_to admin_root
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_root
  end
end

