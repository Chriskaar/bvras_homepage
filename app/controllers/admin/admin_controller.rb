class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
	before_filter :authorized?
	layout 'admin'
	def index
    	prepare_meta_tags title: t('admin.page.dashboard.title')
    	
	end


	private
	
	def authorized?
	    if !current_user.admin?
	    	redirect_to '/'
	    end
	end


end