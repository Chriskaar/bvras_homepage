class AdminController < ApplicationController
	before_action :authenticate_user!

	layout 'admin'

	before_filter :authorized?

	def authorized?
	    if !current_user.admin?
	    	redirect_to '/'
	    end
	end

	def index
		if current_user.admin?
			@working = current_user.name
		else
			@working = 'nope, not admin'
		end
	end
end
