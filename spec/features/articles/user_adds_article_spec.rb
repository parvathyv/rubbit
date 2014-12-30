require 'rails_helper'

feature 'user adds an article', %Q{
  As a user
  I want to add a tech resource
  So I can share with other users 

  [ ] 1) User must be signed in
  [ ] 2) User should be able to add article
  [ ] 3) Article must have a title (between 5-50)
  [ ] 4) Article must have a URL (is valid)
  [ ] 5) Article must have a description (maximum 500) 
} do
  scenario 'user signs in and adds an article' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    
    visit new_article_path 
    
    fill_in 'Title', with: 'New article on Devise'
    fill_in 'Url', with: 'http://stackoverflow.com' 
    fill_in 'Description', with: 'This article gives you information about devise,a user management system' 

    click_button 'Submit'

    expect(page).to have_content('Article successfully added')
    
  end

end