require 'rails_helper'

feature 'admin deletes article', %Q{
  As an admin
  I want to delete an article
  So that I can filter out unwanted articles
} do
  
  scenario 'admin deletes an article' do
    admin = FactoryGirl.create(:admin_user)
    article = FactoryGirl.create(:article)
    user = FactoryGirl.create(:user)
    
    sign_in_as(user)
    add_new_article(article)
    
    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully')

    sign_in_as(admin)

    visit edit_admin_article_path(article)
    click_on 'Delete article'
    expect(page).to have_content "Article successfully deleted"
    visit articles_path
    expect(page).to_not have_content article.name
  end

  

  

end
