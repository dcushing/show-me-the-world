class PlacesController < ApplicationController
  #before_action :set_place
  
  def index
    # set place
    @place = set_place
  end
  
  def show
    # find a place
    @place = Place.find(params[:id])
    
    # look for the woeid in the DB and if it's not there, search for it using the Flickr API
    #if @place.woeid
      #@woeid = @place.woeid
    #else
      #@woeid = GetPhotos.getWoeid(@place)
      #@place.woeid = woeid
    #end
    
    #@photo1 = GetPhotos.new("55986789")
  end
  
  def info
  end
  
  private
  
  def set_place
    places_size = Place.count
    place_index = Random.new.rand(0..places_size)
    current_place = Place.find(place_index)
    session[:current_place] = current_place.id
    return current_place
  end
  
  def place_params
    params.require(:place).permit(:city, :country, :lat, :lng, :pop, :iso2, :iso3, :province)
  end
  
end
