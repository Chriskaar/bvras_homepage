class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :set_locale
  layout :layout_by_resource

	protected



  	def layout_by_resource
	  if devise_controller?
	  	'sessions'
	  else
	  	'front'
	  end
	end


	 private
	  def set_locale
	  	if current_user
	  	I18n.locale = current_user.try(:locale) || I18n.default_locale
	  	else
	  	I18n.locale = params[:locale] || I18n.default_locale
	  	end
	  end

	def default_url_options
	  { locale: I18n.locale }
	end


end