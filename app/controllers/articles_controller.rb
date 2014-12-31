class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

	def create

		@article = Article.new(article_params)

		if @article.save
			redirect_to article_path(@article), :notice => "Article successfully added"
		else
			render :new
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
    @reviews = @article.reviews.order(created_at: :desc)
	end

  private

  def article_params
    params.require(:article).permit(:name, :description, :url, :vote_count)
  end

end
