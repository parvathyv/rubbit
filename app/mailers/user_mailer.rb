class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def review_notice(article)
    @user = article.user
    @url = article_url(article)

    mail to: article.user.email, subject: "New Review"
  end

  def vote_notice(article)
    @user = article.user
    @url = article_url(article)

    mail to: article.user.email, subject: "New Vote"
  end
end
