class ArtistsController < ApplicationController
 before_action :set_artist, except: [:index, :new, :create, :delete_all_songs]

  def index
     @artists = Artist.all
  end

  def show
    @artists = Artist.all
    @song = Song.new


  end

  def destroy
    @artist.destroy
      respond_to do |format|
        if @artist.destroy
          format.json { render :show, status: :destroyed, location: @artist }
        else
          format.json { render json: @artist.errors, status: :unprocessable_entity }
        end
      end
  end

private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def source_params
    params[:source].present? ? params.require(:source) : []
  end
end
