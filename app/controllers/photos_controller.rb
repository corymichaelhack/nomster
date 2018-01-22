class PhotosController < ApplicationController
  before_action :authenticate_user!

  #def create
   # @place = Place.find(params[:place_id])
    #@place.photos.create(photo_params)
    #redirect_to place_path(@place)
  #end

  def create
      @place = Place.find(params[:place_id])
      if @place.photos.create(photo_params).valid?
        @place.photos.create(photo_params.merge(user: current_user))   
        redirect_to place_path(@place)
      else
       # render :show, status: :unprocessable_entity
        return render text: 'Error: Picture was not included or failed to load.', status: :forbidden
      end
  end




  private

  def photo_params
      params.require(:photo).permit(:picture, :caption)
  end

end
