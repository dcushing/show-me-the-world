class PlacesController < ApplicationController
  
  def index
    # set place
    @place = Place.order("random()").first
    @photo1 = GetPhotos.new(@place)
    @photo2 = GetPhotos.new(@place)
    @photo3 = GetPhotos.new(@place)
  end
  
  def show
  end
  
  def info
  end
  
  private
  
  def place_params
    params.require(:place).permit(:city, :country, :lat, :lng, :pop, :iso2, :iso3, :province)
  end
  
end
