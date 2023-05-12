class AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :album_find, only: [:show, :edit, :update]
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

  def edit
    if current_user != @album.user
      redirect_to root_path
    end
  end

  def update
    if @album.update(album_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :category, :album_image).merge(user_id: current_user.id)
  end

  def album_find
    @album = Album.find(params[:id])
  end
end
