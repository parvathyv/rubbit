require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  it 'sends an email when a review is added' do

    article = FactoryGirl.create(:article)
    user = article.user
    ActionMailer::Base.deliveries = []
    Review.create(
    body: "This article was kind of bogus, and lame and dumb",
    user_id: user.id,
    article_id: article.id
    )
    UserMailer.review_notice(article).deliver
    expect(ActionMailer::Base.deliveries.count).to eql(1)
  end
end
