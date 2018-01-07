class SongsController < ApplicationController
  before_action :set_song, only: [:destroy]

    def index
       @songs = Song.all
    end

    def show
      @song = Song.find(params[:id])
    end

    def create
      @song = Song.new(song_params)
      @song.artist_id = params[:artist_id]
        respond_to do |format|
          if @song.save
            format.json { render :show, status: :created, location: @songs }
          else
            format.json { render json: @song.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
      @song.destroy
        respond_to do |format|
          if @song.destroy
            format.json { render :show, status: :destroyed, location: @songs }
          else
            format.json { render json: @song.errors, status: :unprocessable_entity }
          end
        end
    end

    private

    def song_params
      params.require(:song).permit(:id, :title, :artist_id)
    end
end
