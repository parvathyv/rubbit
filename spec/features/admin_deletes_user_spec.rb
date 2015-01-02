require 'rails_helper'

feature 'admin deletes user', %Q{
  As an admin
  I want to delete an user
  So that I can filter out users who don't want to be on the site
} do
  
  scenario 'admin deletes an user' do
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
