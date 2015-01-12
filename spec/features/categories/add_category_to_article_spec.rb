require 'rails_helper'

feature "user can add a category to an article", %q(

As a user
I want to be able to add a category to an article
So that I can see articles on similar topics

Acceptance criteria
[x] A user can add a category when creating an article
[x] A user can see the category on the article's page
) do

  scenario "a user can add a category to an article" do

    user = FactoryGirl.create(:user)
    article = FactoryGirl.create(:article)

    sign_in_as(user)
    visit new_article_path

    fill_in 'article_name', with: article.name
    fill_in 'article_url', with: article.url
    fill_in 'article_description', with: article.description

    click_on "Submit"

    expect(page).to have_content("Ruby")
  end

end
