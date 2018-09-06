class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(params(:name))
    @genre.save
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
    params.require(:genre).permit(:name)
  end
end
