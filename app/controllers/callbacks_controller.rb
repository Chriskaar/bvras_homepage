class CallbacksController < Devise::OmniauthCallbacksController
	def callback 

	end
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
		# redirect_to request.env['omniauth.origin'] || '/default'

    end
end