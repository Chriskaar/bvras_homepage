class ContactController < ApplicationController
	def index
		site_setting = Setting.find(1) 
		prepare_meta_tags title: t('site_meta.contact.title'), description: site_description_locale?
	end
end
