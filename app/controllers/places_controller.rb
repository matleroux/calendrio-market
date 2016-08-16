class PlacesController < ApplicationController
  def index

  end

  def show
    @place = Place.find(params[:id])
    @booking = Booking.new
  end
end
