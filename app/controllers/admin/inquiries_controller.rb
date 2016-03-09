class Admin::InquiriesController < ApplicationController
	before_action :authenticate_user!
	before_filter :authorized?
	layout 'admin'

	def index
		
		@inquiries = Inquirie.all
		@title = t('admin.page.inquiries.title')
	end
	def show

	end

	def authorized?
	    if !current_user.admin?
	    	redirect_to '/'
	    end
	end
end
