class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def review_notice(article)
    @user = article.user
    @email = article.user.email
    @url = "http://rubbit.#{article}"

    mail to: "to@example.org",
    subject: "New Review"
  end

  def vote_notice(article)
    @user = article.user
    @email = article.user.email
    @url = "http://rubbit.#{article}"

    mail to: "to@example.org",
    subject: "New Vote"
  end
end
