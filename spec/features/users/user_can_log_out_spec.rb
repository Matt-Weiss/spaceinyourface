require 'rails_helper'

describe 'A registered user can log out' do
  context 'As a registerd user, when I click on "Log Out"' do
    it 'logs me out, I see a notification, and I am returned to the homepage' do
        user = User.create(
          user_name: 'SpaceCadet',
          email: 'spacecadet@email.com',
          password: 'password',
          password_confirmation: 'password'
        )

      visit root_path

      click_on "Log In"
      fill_in 'session[email]', with: 'spacecadet@email.com'
      fill_in 'session[password]', with: 'password'
      click_button "Log In"

      
      visit root_path

      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out - come back soon!")
    end
  end
end
