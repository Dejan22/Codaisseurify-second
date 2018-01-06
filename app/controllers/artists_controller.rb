class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :destroy]

    def index
      @artist = Artist.all.order(params[:sort])
    end
end
