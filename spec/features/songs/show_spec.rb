require 'rails_helper'

RSpec.describe 'the songs.show page' do

  #as user, when I visit '/songs/1' then I see that song's title and artist
  #and I do not see any of the other songs in my db

  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 8, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 12456357)

    visit "/songs/#{song.id}"
    #localhost3000:songs/1

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 8, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 12456357)

    visit "/songs/#{song.id}"

    save_and_open_page
    
    expect(page).to have_content(artist.name)
  end

end