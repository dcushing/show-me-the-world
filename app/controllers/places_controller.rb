class PlacesController < ApplicationController
  
  def index
    @place = Place.order("random()").first
  end
  
  def show
  end
  
  def info
  end
  
  private
  
  def place_params
    params.require(:place).permit(:city, :city_ascii, :lat, :lng, :pop, :county, :iso2, :iso3, :province)
  end
  
end
