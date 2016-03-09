class CategoriesController < ApplicationController
	respond_to :html
	def show
	    prepare_meta_tags title: t('site_meta.articles.title'), description: t('site_meta.articles.description'), keywords: 'woot, wdwd, wdwdd, wdwd, wdwd'
	    
	    @articles = Article.where(category_id: params[:id])
	    
	    @categories = Category.all
	    respond_with(@articles)

	end
end
