require 'rails_helper'

describe 'User can submit a search request' do
  context 'When I click on the "Search" button' do
    it 'I go to a search form, where I can select the bodies to search for' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on "New Search"
      expect(current_path).to eq(new_search_path)
      
      save_and_open_page

    end
  end
end
