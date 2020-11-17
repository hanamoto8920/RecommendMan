class Public::HomesController < ApplicationController
  
  def top 
    @places = Place.all
    @genres = Genre.all
  end 
  
  def about 
  end 
  
end
