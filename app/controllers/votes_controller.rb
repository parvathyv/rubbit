class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @user = current_user.id
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to articles_path, :notice => "Your vote has been recorded"
    else
      flash[:notice] = "You have already voted"
      render "articles/show"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:vote_tally, :user_id, :article_id)
  end

end
