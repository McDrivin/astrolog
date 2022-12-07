class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.order(:title).page params[:page]
    if params[:query].present?
      @articles = Article.search_by_title(params[:query]).page params[:page]
    else
      @articles = Article.order(:title).page params[:page]
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end

  # def index
  #   @articles = Article.all
  #   # @articles = NasaApi.article_api.order(:title)
  #   if params[:query].present?
  #     @articles = Article.search_by_name(params[:query])
  #     # @articles = NasaApi.article_api.order(:title).search_by_title(params[:query])
  #   else
  #     # @articles = NasaApi.article_api.order(:title)
  #     @articles = Article.all
  #   end
  # end
