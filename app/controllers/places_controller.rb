class PlacesController < ApplicationController
  #before_action :set_place
  
  def index
    # do something
  end
  
  def show
    # show the _trip partial when the "more info" buttom is clicked
    respond_to do |format|
      format.js #{render layout: false}
    end
    @place = Place.order("random()").first
  end
  
  private
  #def set_place
  #  @place = Place.take
  #end
  
  def place_params
    params.require(:place).permit(:city, :city_ascii, :lat, :lng, :pop, :county, :iso2, :iso3, :province)
  end
  
end
