class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def new
    @review = Review.new
  end


  def edit
    @review = Review.find(@review.id)
    if @review.save
      redirect_to article_path(@article), :notice => "Review successfully added"
    else
      redirect_to article_path(@article), :notice => "Review did fail"
    end
  end


  def create
    @user = User.find(current_user.id)
    @article = Article.find(params[:article_id])
    @review = Review.new(review_params)
    @reviews = @article.reviews
    @review.article_id = @article.id
    @review.user_id = @user.id

  if @review.save
    redirect_to article_path(@article), :notice => "Review successfully added"
  else
    redirect_to article_path(@article), :notice => "Review did fail"

  end
end


  private
  def review_params
    params.require(:review).permit(:body, :user_id, :article_id)
  end
end
