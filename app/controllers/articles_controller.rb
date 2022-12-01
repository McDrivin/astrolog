class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
