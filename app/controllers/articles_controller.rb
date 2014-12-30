class ArticlesController < ApplicationController

def new
	@article = Article.new
end

def create

	@article = Article.new(article_params)
	#@article.user_id = current_user.id

	if @article.save
		redirect_to new_article_path, :notice => "Article successfully added"
	else
		render :new
	end

end

private

def article_params
	params.require(:article).permit(:name, :url, :description)
end

end	