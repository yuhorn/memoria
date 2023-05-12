class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to album_path(params[:album_id])
    else
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:memo, :date, :image).merge(user_id: current_user.id, album_id: params[:album_id])
  end
end