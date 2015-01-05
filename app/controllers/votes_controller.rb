class VotesController < ApplicationController


  def create
    @article = Article.find(params[:article_id])
    @user = params[:format]
    @vote = Vote.new

    @upvotes_count = Vote.count(:conditions => "article_id = #{@article.id} AND value = 1")
    @downvotes_count = Vote.count(:conditions => "article_id = #{@article.id} AND value = -1")
    @allvotes_count = Vote.count(:conditions => "article_id = #{@article.id}")

    redirect_to articles_path
  end

  private
  def review_params
    params.require(:vote).permit(:vote_tally, :user_id, :article_id)
  end

end
