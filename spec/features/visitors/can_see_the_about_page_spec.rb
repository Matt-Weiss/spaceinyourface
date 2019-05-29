require 'rails_helper'

describe 'As a visitor' do
  it 'when i visit the about page i expect to see informationon the app' do
    visit about_path

    expect(current_path).to eq(about_path)
    expect(page).to have_content('About')
    expect(page).to have_content('Telescope Instructions')
    expect(page).to have_content('Credits')
  end
end
