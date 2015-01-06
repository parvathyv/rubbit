require 'rails_helper'

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

    sign_in_as(user)
    visit article_path(article)

    click_on 'Up'

    expect(page).to have_content("Your vote has been recorded")

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
