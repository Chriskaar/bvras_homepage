class Admin::ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_filter :authorized?
	layout 'admin'

	def authorized?
	    if !current_user.admin?
	    	redirect_to '/'
	    end
	end
	
	def index 
		
	end

	def new

	end

	def create

	end
	def edit

	end
end
