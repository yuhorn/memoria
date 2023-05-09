class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def album_params
    params.require(:album).permit(:title, :category, :album_image).merge(user_id: current_user.id)
  end
end
