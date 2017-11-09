class PlacesController < ApplicationController
  
  def index
    # set place
    @place = set_place
  end
  
  def show
    # find the place set in index
    @place = Place.find(params[:id])    
    @photo1 = GetPhotos.new(@place)
    @photo2 = GetPhotos.new(@place)
    @photo3 = GetPhotos.new(@place)
  end
  
  def info
  end
  
  private
  
  # so that we can set a session so that the app remembers what location we're talking about even when we move from index to show
  def set_place
    places_size = Place.count - 1
    place_index = Random.new.rand(0..places_size)
    current_place = Place.find(place_index)
    session[:current_place] = current_place.id
    return current_place
  end
  
  def place_params
    params.require(:place).permit(:city, :country, :lat, :lng, :pop, :iso2, :iso3, :province)
  end
  
end
