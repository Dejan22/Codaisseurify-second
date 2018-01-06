require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "Check data" do

    it "Song has a name" do
      song = Song.new(title: "Fashion monkey")
      expect(song.title).to include(song.title)
    end
  end

  describe "Check validations" do
    song = Song.new(title: nil, artist: nil)

    it "is invalid without a name" do
      song.valid?
      expect(song.errors).to have_key(:title)
    end

    it "is invalid without a artist" do
      song.valid?
      expect(song.errors).to have_key(:artist)
    end
  end
end
