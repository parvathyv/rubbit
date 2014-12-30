require 'rails_helper'

feature "user can view an article name, description, and URL", %q(

As a user
I want to be able to look at an article's details
So that I can decide if I want to read the article or not

Acceptance criteria
[ ] A user can view an articles name, description and url

) do

    # let(:article) { FactoryGirl.create(:article) }
    #
    scenario "a user can visit an article page and see name, description, url" do
      article = FactoryGirl.create(:article)
      visit articles_path

      click_on article.name

      expect(page).to have_content(article.name)
      expect(page).to have_content(article.url)
      expect(page).to have_content(article.description)
    end
end