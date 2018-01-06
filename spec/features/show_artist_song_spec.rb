require 'rails_helper'

RSpec.feature "Index page", :type => :feature do
  scenario "home button goes home" do
    visit root_path

    click_link "home"

    expect(page).to have_text("Codaisseurify")
  end
end

# describe "Viewing an artist" do
#   chet = Artist.new(name: "Chet faker")
#   song = Song.new(name: "Willy wonka's funeral", artist: chet)
#
#   it "shows the artist it's song" do
#     visit artist_path([chet.id])
#
#     expect(page).to have_text(chet.name)
#   end
# end
