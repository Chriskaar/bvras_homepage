class Admin::UsersController < ApplicationController
	layout 'admin'
	def index
		@user = User.all
	end
	def edit 

	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		if @user.destroy
			flash[:success] = 'User was successfully deleted!'
			redirect_to admin_users_path
		end

	end
	def show
		@user = User.find(params[:id])
		@title = t('admin.page.users.title')
		@smallTitle = @user.name
	end
end
