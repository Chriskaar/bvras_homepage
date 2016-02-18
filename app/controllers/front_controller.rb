class FrontController < ApplicationController
	layout 'front'
	def index
		prepare_meta_tags title: t('site_meta.home.title'), description: t('site_meta.home.description')
	end 
end
