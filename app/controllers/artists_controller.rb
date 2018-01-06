class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

def index
  @artists = Artist.all
  @songs = Song.all
end

def show
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
end

def new
    @artist = Artist.new
  end

def create
    @artist = Artist.new(artist_params)

    if @artist.save
        redirect_to @artist, notice: "Artist created"
    else
      render :new
    end
end

def destroy
end

private

def set_artist
  @artist = Artist.find(params[:id])
end
# def artist_params
#     params.require(:artists).permit(:name, :songs_id)
#   end
end
