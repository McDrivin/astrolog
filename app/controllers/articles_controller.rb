class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @articles = article.all
    @articles = NasaApi.article_api
    if params[:query].present?
      # @articles = Article.search_by_name(params[:query])
      @articles = NasaApi.article_api.search_by_name(params[:query])
    else
      @articles = NasaApi.article_api
      # @articles = article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
