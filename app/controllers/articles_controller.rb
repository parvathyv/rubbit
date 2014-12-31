class ArticlesController < ApplicationController

before_action :authenticate_user!, only: [:destroy, :delete, :new, :create, :edit, :update]

	def new
		@article = Article.new
	end

	def create
		@user = User.find(current_user.id)

		@article = @user.articles.build(article_params)
	
		if @article.save
			redirect_to new_article_path, :notice => "Article successfully added"
		else
			render :new
		end
	end

	def index
		@articles = Article.order(created_at: :desc).page(params[:page]).per(10)
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

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		if @article.destroy
			redirect_to root_path, notice: "Article was successfully deleted"
		else
			render :edit, notice: "Article was not deleted"
		end
	end

	private

	def article_params
		params.require(:article).permit(:name, :description, :url, :vote_count)
	end
end
