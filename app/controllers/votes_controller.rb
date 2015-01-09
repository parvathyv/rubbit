class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :update]

  def create
    @article = Article.find(params[:article_id])
    @user = current_user.id
    @reviews = @article.reviews.page(params[:page]).per(10)
    @vote = Vote.new(vote_params)

    if @vote.save
      UserMailer.vote_notice(@article).deliver
      redirect_to article_path(@article), :notice => "Your vote has been recorded"
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
