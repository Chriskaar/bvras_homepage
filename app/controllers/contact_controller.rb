class ContactController < ApplicationController
	respond_to :html
	
	def index
		# SEO
		prepare_meta_tags title: t('page.contact.title'), description: site_description_locale?
		
		# Get all Departments with contact information
		@departments = Department.all
		
		# Contact Form
		@inquirie = Inquirie.new
		respond_with(@inquirie)
	end


  private


    def inquirie_params
      params.require(:inquirie).permit(:name, :email, :message, :user)
    end
end
