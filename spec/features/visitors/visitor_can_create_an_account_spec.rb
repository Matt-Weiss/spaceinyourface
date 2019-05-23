require 'rails_helper'

describe 'a visitor can create an account' do
  context 'when I visit the homepage and click on "Register"' do
    it 'brings me to a registration page which I can fill out' do

      visit root_path

      click_on "Register"

      expect(current_path).to eq(new_user_path)

      fill_in 'user_name', with: 'SpaceCadet'
      fill_in 'email', with: 'spacecadet@email.com'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'

      click_button "Register"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Thank you for signing up - you are successfully logged in!")
    end
  end
end
