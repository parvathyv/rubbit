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

    click_on "Add review"
    fill_in "Review", with: "This article fucking sucks."
    click_on "Submit"

    expect(page).to have_content("This article fucking sucks.")


  scenario "a user who is not signed in can't add a review to an article" do
  end



end
