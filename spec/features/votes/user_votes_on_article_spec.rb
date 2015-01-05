require 'rails_helper'

feature "User votes on an article", %q(

As a user
I want to be able to upvote/downvote an article
So that I can help other users find useful/less useful articles

Acceptance criteria
[ ] A user can upvote an article on the article's page and have the vote recorded.
[ ] A user can downvote an article on the article's page and have the vote recorded.
[ ] A user must be signed in to vote.
[ ] A user can only vote once on an article.
[ ] The total score for votes is shown on the index page.
[ ] The total score for votes is also shown on the article's page.
) do


  let!(:user) { FactoryGirl.create(:user) }
  let!(:article) { FactoryGirl.create(:article, user: user) }

  scenario "A user upvotes an article" do

    sign_in_as(user)
    visit article_path(article)

    click_on 'Upvote'

    expect(page).to have_content("Your vote has been recorded")
    #expect(page).to have_content vote.count + 1

  end

end
