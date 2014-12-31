class ArticlesController < ApplicationController

before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

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
		id = params[:id]
		@article = Article.find(params[:id])
		if current_user.id != @article.user_id
			redirect_to @article, :notice => "Invalid user"
		end
	end

	def update
		@article = Article.find(params[:id])
		#binding.pry
		if current_user.id != @article.user_id
			redirect_to @article, :notice => "Invalid user"
		else
			if @article.update_attributes(article_params)
				redirect_to edit_article_path, :notice => "Article successfully edited"
			else
				render :edit, :notice => "Article did not update"
			end
		end	

	end

  private

  def article_params
    params.require(:article).permit(:name, :description, :url, :vote_count)
  end

end
