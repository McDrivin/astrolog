class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @articles = article.all
    @articles = NasaApi.article_api
  end

  def show
    @article = Article.find(params[:id])
  end
end
