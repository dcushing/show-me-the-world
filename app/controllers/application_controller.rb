class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  
  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
  
  def set_place
     num_places = Place.count
     random_id = Random.new.rand(1..num_places)
     @place = Place.find(params[:random_id])
     return @place
  end
  
end
