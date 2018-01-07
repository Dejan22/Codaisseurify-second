class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_song, only: [:destroy]

    def index
       @songs = Song.all
       @song = Song.new
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
        format.html { redirect_to request.env["HTTP_REFERER"], notice: 'Song was successfully erased!!!' }
        format.json { head :no_content }
      end
    end

    private

    def song_params
      params.require(:song).permit(:id, :title, :artist_id)
    end
end
