class AlbumsController < ApplicationController
  def index
  end

  private
  def album_params
    params.require(:album).permit(:title, :category, :album_image).merge(:user_id: current_user.id)
  end
end
