class VotesController < ApplicationController


  def create
    @article = Article.find(params[:article_id])
    @user = current_user.id
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to articles_path, :notice => "HUZZAH!!!!!!!!!!"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:vote_tally, :user_id, :article_id)
  end

end
