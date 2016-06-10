class PhotosController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @photo = @place.photos.create(photo_params)
    if @photo.invalid?
      flash[:error] = '<strong>Could not save photo</strong>, the data you entered is invalid.'
    end
    redirect_to place_path(@place)
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end
end
