class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

	def create

		@article = Article.new(article_params)

		if @article.save
			redirect_to new_article_path, :notice => "Article successfully added"
		else
			render :new
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
			if @article.update_attributes(article_params)
				redirect_to edit_article_path, :notice => "Article successfully edited"
			else
				render :edit, :notice => "Article did not update"
			end

	end

  private

  def article_params
    params.require(:article).permit(:name, :description, :url, :vote_count)
  end

end
