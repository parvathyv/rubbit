class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @reviews = @article.reviews
    @review.article_id = @article.id

  if @review.save
    redirect_to article_path(@article), :notice => "Article successfully added"
  else
    flash[:message] = "You bafoon, type something longer!!"
    render :create
  end
end


  private
  def review_params
    params.require(:review).permit(:body)
  end
end
