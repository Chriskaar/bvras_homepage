class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    prepare_meta_tags title: t('site_meta.articles.title'), description: t('site_meta.articles.description'), keywords: 'woot, wdwd, wdwdd, wdwd, wdwd'
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    prepare_meta_tags title: @article.name, description: @article.content, keywords: 'woot, woot'
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name, :permalink, :content)
    end
end
