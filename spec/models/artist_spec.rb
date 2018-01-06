require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "Check Artist data" do

    it "Artist have a name" do
      artist = Artist.new(name: "Miles Davies")
      expect(artist.name).to include(artist.name)
    end

    end

  describe "Check Song data" do
    song = Song.new(name: nil, artist: nil)

    it "Song is invalid without a name" do
      song.valid?
      expect(song.errors).to have_key(:name)
    end
    it "Song is invalid without a artist" do
      song.valid?
      expect(song.errors).to have_key(:artist)
    end
  end
