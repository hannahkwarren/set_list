require 'rails_helper'

RSpec.describe 'Artist edit' do

  it 'links to the edit page' do
    artist = Artist.create!(name: "Prince")

    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: "Price")

    visit "/artists"

    expect(page).to have_content("Price")
    click_button "Edit Price"

    fill_in("Name", with: "Prince")
    click_button('Update Artist')

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Prince")
  end

end