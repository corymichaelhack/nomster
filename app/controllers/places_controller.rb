class PlacesController < ApplicationController
  def index
    @places = Place.order("name").page(params[:page]).per(2)    
  end

  def new
    @places = Place.new
  end
end
