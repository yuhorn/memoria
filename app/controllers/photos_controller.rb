class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :album_find, only: [:new, :destroy]
  
  def new
    @photo = Photo.new
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

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to album_path(params[:album_id]), notice: "投稿を削除しました。"
  end

  private
  def photo_params
    params.require(:photo).permit(:memo, :date, :image).merge(user_id: current_user.id, album_id: params[:album_id])
  end

  def album_find
    @album = Album.find(params[:album_id])
  end
end