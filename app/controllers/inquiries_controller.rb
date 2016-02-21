class InquiriesController < ApplicationController
 	respond_to :html
	def create
		@inquirie = Inquirie.new(inquirie_params)
		@inquirie.save!
		redirect_to contact_path
	end
    def inquirie_params
      params.require(:inquirie).permit(:name, :email, :message, :user)
    end
end
