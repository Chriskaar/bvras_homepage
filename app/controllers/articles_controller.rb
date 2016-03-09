class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :tag_cloud
  before_action :add_to_meta
  respond_to :html

  def index
    prepare_meta_tags title: @meta.title, description: @meta.description
    
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    elsif params[:category]
      @articles = Article.where(category_id: params[:category])
    else
      @articles = Article.all
      @categories = Category.all
      respond_with(@articles)
    end
  end

  def show
    prepare_meta_tags title: @article.name, description: @article.content, keywords: @article.tags.map(&:name).map { |t| t}.join(', ')
    if @article.category_id
      @category = Category.find(@article.category_id)
    end
    respond_with(@article)
  end

  def tag_cloud
    @tags = Article.tag_counts_on(:tags)
  end

  private
    def set_article
      @article = Article.find_by_permalink(params[:permalink])
    end
    def add_to_meta
      @meta = Meta.where(controller: controller_name).last
      if !@meta
        Meta.create(:controller => "controller_name")
      end 
    end
end
