class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  private

  def article_params
    params.require(:article).permit(:name, :description, :url, :vote_count)
  end

end
