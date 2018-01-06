require 'rails_helper'

feature 'Song functionality', js: true do
  let!(:artist)   { create :artist }
  let!(:song1)     { create :song, artist: artist, name: 'Moonlight'}
  let!(:song2)     { create :song, artist: artist, name: 'Dave Brubeck'}


  scenario 'Show Artist overview' do
    visit root_path
    expect(page).to have_content('Codaisseurify-second')
  end
  scenario 'add a new song' do
    visit artist_path(id: "1")
    page.fill_in 'Add song?', :with => 'Take Five'
    page.execute_script("$('form').submit()")
    expect(page).to have_content('Take Five')
  end
  scenario 'Remove 1 song from Artist' do
    visit artist_path(id:"1")
    sleep(0.5)
    find(:xpath, "//*[@id='1']").click
    sleep(0.5)
    expect(page).to_not have_content('Moolight')
  end
  scenario 'Remove all songs from Artist' do
    visit artist_path(id:"1")
    click_button 'Delete all'
    expect(page).to_not have_content('Moonlight')
  end
end
