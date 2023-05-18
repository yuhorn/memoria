class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @photo = Photo.new
    @album = Album.find(params[:album_id])
    if current_user != @album.user
      redirect_to root_path
    end
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to album_path(params[:album_id])
    else
      render :new
    end
  end

  def index
    @photos = Photo.order("date DESC")
  end

  def destroy
  end

  private
  def photo_params
    params.require(:photo).permit(:memo, :date, :image).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end