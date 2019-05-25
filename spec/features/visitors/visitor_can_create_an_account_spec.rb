require 'rails_helper'

describe 'As a visitor' do
  context 'when I visit the homepage and click on "Register"' do
    before :each do
      visit root_path
      click_on "Register"
    end

    it 'brings me to a registration page with a form which I can fill out' do
      expect(current_path).to eq(new_user_path)

      fill_in 'user[user_name]', with: 'SpaceCadet'
      fill_in 'user[email]', with: 'spacecadet@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button "Create Account"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Thank you for signing up - you are successfully logged in!")

      user = User.last

      expect(user.email).to eq('spacecadet@email.com')
    end

    it 'notifies me of any info errors, and autofills my form with previous answers' do
      expect(current_path).to eq(new_user_path)

      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button "Create Account"

      expect(page).to have_content("User name can't be blank, Email can't be blank")

      fill_in 'user[user_name]', with: 'SpaceCadet'
      fill_in 'user[email]', with: 'spacecadet@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'not-password'

      click_button "Create Account"

      expect(page).to have_content("Password confirmation doesn't match Password")

      expect(find_field('user[user_name]').value).to eq('SpaceCadet')
      expect(find_field('user[email]').value).to eq('spacecadet@email.com')
    end
  end
end
