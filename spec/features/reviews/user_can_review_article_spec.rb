require 'rails_helper'

feature "user can add a review to an article", %q(

As a user
I want to be able to review an article
So that I can desribe how I feel about its usefulness

Acceptance criteria
[ ] A user can post a review on an article.
[ ] A user can see their article posted.
[ ] User reviews should be posted with most recent first
[ ] A user
) do


  before :each do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end



  # let(:article) { FactoryGirl.create(:article) }
  #
  scenario "a user can add a review to an article" do

    article = FactoryGirl.create(:article)
    visit articles_path

    click_on article.name

    fill_in "Body", with: "This article fucking sucks."
    click_on "Add Review"

    expect(page).to have_content("This article fucking sucks.")
    expect(page).to have_content("Review successfully added")

  end

  scenario "a user sees an error if they don't submit a full review" do

    article = FactoryGirl.create(:article)
    visit articles_path

    click_on article.name

    click_on "Add Review"

    expect(page).to have_content("Review did fail")
  end

  scenario "a user can edit a review" do

    article = FactoryGirl.create(:article)
    visit articles_path

    click_on article.name

    fill_in "Body", with: "This article fucking sucks."
    click_on "Add Review"

    click_on "Edit Review"
    fill_in "Body", with: "This article is actually awesome."
    click_on "Submit Edits"

    expect(page).to have_content("Review succesfully edited")
    expect(page).to have_content("This article is actually awesome.")
  end


end
