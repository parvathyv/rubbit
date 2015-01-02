require 'rails_helper'

feature 'admin views users', %Q{
  As an admin
  I want to view a list of users
  So that I can keep track of the site
} do
  
  scenario 'admin views all users' do
    admin = FactoryGirl.create(:admin_user)
    
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)

    sign_in_as(admin)

    visit admin_users_path
   
    expect(page).to have_content user.email
    expect(page).to have_content user1.email
    
  end

  

end
