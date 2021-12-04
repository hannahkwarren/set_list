class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    redirect_to "/artists"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to "/artists"
  end

private #only available inside classes they're defined in (this controller)
#for security and good encapsulation
  def artist_params
    params.permit(:name)
  end
end