class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :prepare_meta_tags, if: "request.get?"
  layout :layout_by_resource



	def prepare_meta_tags(options={})
		# Get settings from database
		@site_setting = Setting.find(1)
		title       = ''
		site_name   = @site_setting.site_name
		description = @site_setting.site_description
		image       = options[:image] || "logo"
		current_url = request.url
		keywords	= ''
		google 		= @site_setting.google_profile

		# Let's prepare a nice set of defaults
		defaults = {
		  title:       	title,
		  site:        	site_name,
		  reverse: 	   	true,
		  image:       	image,
		  description: 	description,
		  keywords:    	keywords,
		  publisher:   	google,
		  twitter: {
		    site_name: site_name,
		    site: '@thecookieshq',
		    card: 'summary',
		    description: description,
		    image: image
		  },
		  og: {
		    url: current_url,
		    site_name: site_name,
		    title: title,
		    image: image,
		    description: description,
		    type: 'website'
		  }
		}

		options.reverse_merge!(defaults)

		set_meta_tags options
	end

	protected
  	def layout_by_resource
	  if devise_controller?
	  	'sessions'
	  elsif controller_name == 'admin'
	  	'admin'
	  else
	  	'front'
	  end
	end


	 private
	  def set_locale
	  	#if current_user
	  	#I18n.locale = current_user.try(:locale) || I18n.default_locale
	  	#else
	  	I18n.locale = params[:locale] || I18n.default_locale
	  	#end
	  end

	def default_url_options
	  { locale: I18n.locale }
	end

	def site_setting?(attribute)
		@setting = Setting.find(1)
		@setting.try(attribute)
	end

	def site_description_locale?
		site_setting?("site_description_#{I18n.locale}")
	end



end