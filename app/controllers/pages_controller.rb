class PagesController < ApplicationController
	def index

	end
	def show

		if params[:permalink]
			@page = Page.find_by_permalink(params[:permalink])
			raise ActiveRecord::RecordNotFound, 'Page not found' if @page.nil?
		else
			@page = Page.find(params[:id])
		end

		@title = @page.name
	end
end

