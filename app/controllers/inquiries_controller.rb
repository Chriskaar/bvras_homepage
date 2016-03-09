class InquiriesController < ApplicationController
 	respond_to :html
	def create
		@inquirie = Inquirie.new(inquirie_params)
		@inquirie.user_id = current_user.id if current_user
		if @inquirie.save!
			flash[:success] = "The inquirie was succesfully sent"
			redirect_to contact_path
		else
			render 'new'
		end
	end
    def inquirie_params
      params.require(:inquirie).permit(:name, :email, :message, :user_id)
    end
end
