feature "User can delete an article", %q{
	As an authenticated user
	I want to delete an item
	So that no one can review it

	[x] 1) User can delete an article
	[x] 2) Only the user who posted the article can delete it
} do
  
let!(:user) { FactoryGirl.create(:user) }
let!(:article) { FactoryGirl.create(:article, user: user) }

scenario "User deletes an article" do

    sign_in_as(user)

    visit edit_article_path(article.id)
    click_on 'Delete article'
    expect(page).to have_content "Article was successfully deleted"
	end

scenario "Malicious user tries to delete an article that he did not post (I hate that guy)" do
   
    sign_in_as(user)

	add_new_article(article)

    click_link 'Sign Out'
    
    malicious_user
   
    visit edit_article_path(article.id)
    expect(page).to have_content('Invalid user')

  end

end