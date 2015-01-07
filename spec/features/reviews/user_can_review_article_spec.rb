require 'rails_helper'

feature "user can add a review to an article", %q(

As a user
I want to be able to review an article
So that I can desribe how I feel about its usefulness

Acceptance criteria
[x] A user can post a review on an article.
[x] A user can see their article posted.
[x] User reviews should be posted with most recent first
) do

  let!(:review) { FactoryGirl.create(:review)}

  scenario "a user can add a review to an article" do
    ActionMailer::Base.deliveries = []
    email = "to@example.org"

    sign_in_as(review.user)
    visit articles_path

    click_on review.article.name
    click_on "Add a Review"

    fill_in "Body", with: "Some other piece of writing here"
    click_on "Add Review"

    expect(page).to have_content("Some other piece of writing here")
    expect(page).to have_content("Review successfully added")

    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject("New Review")
    expect(last_email).to deliver_to(email)
  end

  scenario "a user sees an error if they don't submit a full review" do
    sign_in_as(review.user)

    visit articles_path

    click_on review.article.name
    click_on "Add a Review"

    click_on "Add Review"

    expect(page).to have_content("Review did fail")
  end

  scenario "a user can edit a review" do

    sign_in_as(review.user)
    visit articles_path

    click_on review.article.name

    click_on "Edit Review"

    fill_in "Body", with: "This article is actually awesome."
    click_on "Save"

    expect(page).to have_content("Review successfully edited")
    expect(page).to have_content("This article is actually awesome.")
  end

  scenario "a user can delete their review" do

    sign_in_as(review.user)
    visit articles_path

    click_on review.article.name
    click_on "Edit Review"

    click_on "Delete"

    expect(page).to have_content("Review deleted")
  end

end
