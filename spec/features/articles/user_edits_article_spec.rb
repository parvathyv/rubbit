require 'rails_helper'

feature 'User edits an article', %q(
	As an authenticated user 
	I want to update an item's information 
	So that I can correct errors or provide new information

	Acceptance criteria:

	[x] The user must be logged in
	[x] The user can edit an article
	[ ] Only the user who posted the article can edit it
) do

scenario 'User edits an article' do

	user = FactoryGirl.create(:user)
	article = FactoryGirl.create(:article)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'


    visit edit_article_path(article.id)

    fill_in 'Name', with: 'New article on Devise'
    fill_in 'Url', with: 'http://stackoverflow.com'
    fill_in 'Description', with: 'This article gives you information about devise,a user management system'

    click_button 'Submit'

    expect(page).to have_content('Article successfully edited')

  end

scenario 'User edits an article' do

	user = FactoryGirl.create(:user)
	article = FactoryGirl.create(:article)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_article_path(article.id)
    fill_in 'Name', with: 'New article on Devise'
    fill_in 'Url', with: 'http://stackoverflow.com'
    fill_in 'Description', with: 'This article gives you information about devise,a user management system'

    click_button 'Submit'

    expect(page).to have_content('Article successfully edited')

  end

  scenario 'Wrong user edits an article' do

	user = FactoryGirl.create(:user)
	article = FactoryGirl.create(:article)
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
   
	visit new_article_path
    fill_in 'Name', with: article.name
    fill_in 'Url', with: article.url
    fill_in 'Description', with: article.description

    click_button 'Submit'
    click_link 'Sign Out'
    
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in' 
    visit edit_article_path(article.id)
    
    fill_in 'Name', with: 'New article on Devise'
    fill_in 'Url', with: 'http://stackoverflow.com'
    fill_in 'Description', with: 'This article gives you information about devise,a user management system'

    click_button 'Submit'

    expect(page).to have_content('Invalid user')

  end
end
