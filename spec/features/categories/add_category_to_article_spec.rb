require 'rails_helper'

feature "user can add a category to an article", %q(

As a user
I want to be able to add a category to an article
So that I can see articles on similar topics

Acceptance criteria
[x] A user can add a category when creating an article
[x] A user can see the category on the article's page
) do

  scenario "a user can add a category to an article", focus: true do

    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit new_article_path

    fill_in 'Name', with: "Name for an article"
    fill_in 'Url', with: "http://article.com"
    fill_in 'Description', with: "Article description"
    select 'Ruby', from: 'article_category_id'

    click_on "Submit"

    expect(page).to have_content("Ruby")
  end

end
