require 'rails_helper'
include EmailSpec::Helpers
include EmailSpec::Matchers

feature "User votes on an article", %q(

As a user
I want to be able to upvote/downvote an article
So that I can help other users find useful/less useful articles

Acceptance criteria
[x] A user can upvote an article on the article's page and have the vote recorded.
[x] A user can downvote an article on the article's page and have the vote recorded.
[x] A user can only vote once on an article.
) do


  let!(:user) { FactoryGirl.create(:user) }
  let!(:article) { FactoryGirl.create(:article, user: user) }

  scenario "A user upvotes an article" do
    ActionMailer::Base.deliveries = []
    email = "to@example.org"

    sign_in_as(user)
    visit article_path(article)

    click_on 'Up'

    expect(page).to have_content("Your vote has been recorded")
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject("New Vote")
    expect(last_email).to deliver_to(email)
  end

  scenario "A user downvotes an article" do

    sign_in_as(user)
    visit article_path(article)

    click_on 'Down'

    expect(page).to have_content("Your vote has been recorded")

  end

  scenario "A user can only vote once" do

    sign_in_as(user)
    visit article_path(article)
    click_on 'Up'
    click_on 'Up'

    expect(page).to have_content("You have already voted")

  end
end
