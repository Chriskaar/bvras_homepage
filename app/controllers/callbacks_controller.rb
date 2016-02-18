class CallbacksController < Devise::OmniauthCallbacksController
	def callback 

	end
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.admin
        	redirect_to root_path
        else
        	redirect_to admin_path
        end
    end
    def dropbox
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted? && @user.admin
            sign_in_and_redirect @user
        elsif @user.persisted?
            sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
end