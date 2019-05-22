require 'rails_helper'

describe 'User can log in using OAuth' do
  context 'As a user who clicks on the Log In button' do
    it 'allows me the option to log in using OAuth with a google account' do

      visit root_path

      click_on "Log In"
      expect(current_path).to eq(login_path)
      # https://github.com/zquestz/omniauth-google-oauth2
      # want email and token


        # OmniAuth.config.test_mode = true
        # mock_auth_hash = { 'provider' => 'google',
        #              'uid' => '123',
        #              'info' => {},
        #              'credentials' => { 'token' => '123456', 'expires' => false },
        #              'extra' => {} }
        # OmniAuth.config.mock_auth[:github] = mock_auth_hash

      click_on "Sign In Using Google"

      expect(current_path).to eq(root_path)

      # expect(@user.git_id).to eq(123)
      # expect(@user.git_key).to eq("123456")

      expect(page).to have_content('Successfully logged in!')

    end
  end
end
