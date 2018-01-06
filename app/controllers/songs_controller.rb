class SongsController < ApplicationController
      before_action :set_song, only: :destroy


    def index
      @song = Song.find(params[:id])
      @songs = @song.artist_id
      # @songs = Song.all
    end

    def show
      
      @songs = Song.all
        @song = Song.find(params[:id])
    end

    def create
      @song = Song.new(song_params)
      @song.artist_id = params[:artist_id]

      respond_to do |format|
       if @song.save
         format.html { redirect_to request.env["HTTP_REFERER"], notice: 'Song was adedd!' }
         format.json { render :show, status: :created, location: @songs }
       else
         format.html { redirect_to request.env["HTTP_REFERER"] }
         format.json { render json: @song.errors, status: :unprocessable_entity }
       end
      end
    end
    def destroy
    @song.destroy

    redirect_to @song.artist, notice: "Song successfully removed."
    end


    private

    def song_params
      params.require(:song).permit(:id, :title, :artist_id)
    end
end
