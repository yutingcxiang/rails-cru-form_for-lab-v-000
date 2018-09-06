class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end
  
  def show
    @artist = Artist.find_by(id: params[:id])
  end
  
  def edit
    @artist = Artist.find_by(id: params[:id])
  end
  
  def update
    @artist = Artist.find_by(id: params[:id])
    @artist.update(params(:name, :bio))
    redirect_to artist_path(@artist)
  end
  
  def params(*args)
    params.require(:artist).permit(*args)
  end
end
