class CommentsController < ApplicationController
  before_action :authenticate_user!

  #def create
   # @place = Place.find(params[:place_id])
    #@place.comments.create(comment_params.merge(user: current_user))   
    #redirect_to place_path(@place)
  #end 



  def create
      @place = Place.find(params[:place_id])
      if @place.comments.create(comment_params).valid?
        @place.comments.create(comment_params.merge(user: current_user))   
        redirect_to place_path(@place)
      else
       # render :show, status: :unprocessable_entity
        return render text: 'Error: Comment message was not included.', status: :forbidden
      end
  end





  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
