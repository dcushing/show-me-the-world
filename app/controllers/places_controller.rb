class PlacesController < ApplicationController
  before_action :set_place
  
  def index
    # set place
    #@place = @@place #Place.order("random()").first
    #@photo1 = GetPhotos.new(@place)
    #@photo2 = GetPhotos.new(@place)
    #@photo3 = GetPhotos.new(@place)
    #@@place# = Place.order("random()").first
  end
  
  def show
    # find a place
    @place = set_place #Place.order("random()").first
    
    # look for the woeid in the DB and if it's not there, search for it using the Flickr API
    if @place.woeid
      @woeid = @place.woeid
    else
      @woeid = GetPhotos.getWoeid(@place)
      @place.woeid = woeid
    end
    
    @photo1 = GetPhotos.new(@woeid)
  end
  
  def info
  end
  
  private
  
  def place_params
    params.require(:place).permit(:city, :country, :lat, :lng, :pop, :iso2, :iso3, :province)
  end
  
end
