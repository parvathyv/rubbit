module Admin
  class ArticlesController < ApplicationController
  	before_filter :admin_authorize!
  	def index
  		@article = Article.all
    end		
  	def new
  		@article = Article.new
  	end	
    
  	def destroy
  		
			 @article = Article.find(params[:id])
			 
				@article = Article.find(params[:id]).destroy
				
				if Article.exists?(@article) == false
					
					redirect_to articles_path, :notice => "Article successfully deleted"
				else
					render :edit, :notice => "Article did not delete"
				
			end	
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

end  
end

