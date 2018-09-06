class SongsController < ApplicationController
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to genre_path(@genre)
  end
  
  def show
    @genre = Genre.find_by(id: params[:id])
  end
  
  def edit
    @genre = Genre.find_by(id: params[:id])
  end
  
  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.update(params(:name))
    redirect_to genre_path(@genre)
  end
  
  def params(*args)
    params.require(:genre).permit(*args)
  end
end
