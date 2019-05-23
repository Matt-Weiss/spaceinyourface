require 'rails_helper'

describe 'User can log in using OAuth' do
  context 'As a user who clicks on the Log In button' do
    it 'allows me the option to log in using OAuth with a google account' do

      visit root_path

      click_on "Log In"
      expect(current_path).to eq(login_path)
      # https://github.com/zquestz/omniauth-google-oauth2
      # https://medium.com/@jalena.marie.taylor/getting-started-with-omniauth-1f3924e783ea
      # want email and token

        OmniAuth.config.test_mode = true
          mock_auth_hash = {
            "provider"=>"google_oauth2",
            "uid"=>"12345",
            "info"=> {
              "name"=>"Sammy Space",
              "email"=>"sammyspace@gmail.com",
            "credentials"=> {
              "token"=>"ya29.GlsSB73c7E1WrSlnJ3qJAlhf_RCWJQkGeUYtt15kaUeM2sX3TRIMH3ql5lWKV9QlEeG1nPtu-96YEJePSOOoLzJ5cF9b_frlINfmXLxYHBKuLPMi8TvZOwN-0Fhb",
              "expires_at"=>1558570259,
              "expires"=>true}
            }}
        OmniAuth.config.mock_auth[:google_oauth2] = mock_auth_hash

      click_on "Sign In Using Google"
      # OAuth happens
      expect(current_path).to eq(root_path)

      user = User.last
      expect(user.name).to eq("Sammy Space")
      expect(user.email).to eq("sammyspace@gmail.com")
      expect(page).to have_content('Successfully logged in!')
    end
  end
end
