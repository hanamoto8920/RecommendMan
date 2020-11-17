class Public::PlacesController < ApplicationController
  
  
  def index 
    @place = Place.new
    @places = Place.all
  end 
  
  def create 
    place = Place.new(place_params)
    place.save
    redirect_to places_path
  end 
  
  private
  def place_params
    params.require(:place).permit(:name)
  end 
  
end
