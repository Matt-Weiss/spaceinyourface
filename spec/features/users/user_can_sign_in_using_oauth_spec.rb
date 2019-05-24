require 'rails_helper'

describe 'User can log in using OAuth' do
  context 'As a user who clicks on the Log In button' do
    it 'allows me the option to log in using OAuth with a google account' do

      visit root_path

      click_on "Log In"
      expect(current_path).to eq(login_path)

        OmniAuth.config.test_mode = true
          mock_auth_hash = {
            "provider"=>"google_oauth2",
            "uid"=>"12345",
            "info"=> {
              "name"=>"Sammy Space",
              "email"=>"sammyspace@gmail.com"},
            "credentials"=> {
              "token"=>"HBKuLPMi8TvZOb",
              "expires_at"=>1558570259,
              "expires"=>true}
            }
        OmniAuth.config.mock_auth[:google_oauth2] = mock_auth_hash

      click_button "Sign In Using Google"

      expect(current_path).to eq(root_path)

      user = User.last

      expect(user.user_name).to eq("sammyspace")
      expect(user.email).to eq("sammyspace@gmail.com")
      expect(page).to have_content('Successfully logged in!')
    end
  end
end
