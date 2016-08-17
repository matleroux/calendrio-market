class PlacesController < ApplicationController

  def home
  end

  def index
    @places = Place.all
    if params[:search] && params[:search][:city].present?
      @places = @places.where("city like ?", params[:search][:city])
    end
    if params[:search] && params[:search][:capacity].present?
      @places = @places.where("max_capacity >= ?", params[:search][:capacity])
    end
  end

  def show
    @place = Place.find(params[:id])
    @booking = Booking.new
    @place_coordinates = { latitude: @place.latitude, longitude: @place.longitude }
  end
end
