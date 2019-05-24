require 'rails_helper'

describe 'A registered user can log out' do
  context 'As a registerd user, when I click on "Log Out"' do
    it 'logs me out, I see a notification, and I am returned to the homepage' do

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      random_path = [root_path, new_search_path, search_index_path].sample

      visit random_path

      click_on "Log Out"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Successfully logged out - come back soon!")
    end
  end


  #   before :each do
  #     @user = User.create(
  #       user_name: 'SpaceCadet',
  #       email: 'spacecadet@email.com',
  #       password: 'password',
  #       password_confirmation: 'password'
  #     )
  #   end
  #
  #   context 'when I enter valid information' do
  #     it 'displays a success message and am redirected to the root_path' do
  #       visit root_path
  #
  #       click_on "Log In"
  #       expect(current_path).to eq(login_path)
  #
  #       fill_in 'session[email]', with: 'spacecadet@email.com'
  #       fill_in 'session[password]', with: 'password'
  #
  #       click_button "Log In"
  #
  #       expect(current_path).to eq(root_path)
  #       expect(page).to have_content("Successfully logged in!")
  #     end
  #   end
  #
  #   context 'when I enter invalid information' do
  #     it 'displays an invalid credentials message, and I can try again' do
  #       visit root_path
  #
  #       click_on "Log In"
  #       expect(current_path).to eq(login_path)
  #
  #       fill_in 'session[email]', with: 'spacecadet@email.com'
  #       fill_in 'session[password]', with: 'wrong-password'
  #
  #       click_button "Log In"
  #
  #       expect(current_path).to eq(login_path)
  #       expect(page).to have_content("Invalid Credentials")
  #     end
  #   end
  # end
end
