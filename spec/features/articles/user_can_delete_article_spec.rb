feature "User can delete an article", %q{
	As an authenticated user
	I want to delete an item
	So that no one can review it

	[x] 1) User can delete an article
	[ ] 2) Only the user who posted the article can delete it
} do

scenario "User deletes an article" do

	user = FactoryGirl.create(:user)
	article = FactoryGirl.create(:article, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit edit_article_path(article.id)
    click_on 'Delete article'
    expect(page).to have_content "Article was successfully deleted"
	end

scenario "Malicious user tries to delete an article that he did not post (I hate that guy)" do

	user = FactoryGirl.create(:user)
	article = FactoryGirl.create(:article, user: user)
    
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in' 
   
	visit new_article_path
    fill_in 'Name', with: article.name
    fill_in 'Url', with: article.url
    fill_in 'Description', with: article.description

    click_button 'Submit'
    click_link 'Sign Out'
    
    visit new_user_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
   
    visit edit_article_path(article.id)
    expect(page).to have_content('Invalid user')

  end

end