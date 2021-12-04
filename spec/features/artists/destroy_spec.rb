require 'rails_helper'

RSpec.describe 'Destroying an Artist' do

  it 'can delete the artist from the index page' do
    artist = Artist.create(name: "Prince")

    visit '/artists'

    click_button "Delete"

    expect(current_path).to eq('/artists')
    expect(page).to have_no_content("Prince")
  end
end