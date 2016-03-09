class Admin::ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	before_filter :authorized?
	layout 'admin'
	respond_to :html


	
	def index 
		@articles = Article.all
	end

	def new

	end

	def create

	end
	def edit

	end
	def update


		if @article.update(article_params)

			flash[:success] = t('notice.success.article_update')
			redirect_to edit_admin_article_path(@article)

		else 
			flash[:error] = t('notice.error.artice_update')
			render 'edit'
		end 

	end
	def destroy
		if @article.destroy
			flash[:success] = t('notice.success.article_delete')
			redirect_to admin_articles_path
		else
			flash[:error] = t('notice.error.article_delete')
			redirect_to admin_articles_path
		end
	end

	private
    def set_article
      @article = Article.find_by_permalink(params[:permalink])
    end
    def article_params
      params.require(:article).permit(:name, :permalink, :content, :tag_list)
    end

	def authorized?
	    if !current_user.admin?
	    	redirect_to '/'
	    end
	end
end
