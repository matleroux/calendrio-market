class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def home
  end

  def index

    @places = Place.where.not(latitude: nil, longitude: nil)
    if params[:search] && params[:search][:city].present?
      @places = @places.where("city like ?", "%#{params[:search][:city]}%")
    end
    if params[:search] && params[:search][:capacity].present?
      @places = @places.where("max_capacity >= ?", params[:search][:capacity])
    end

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @place = Place.find(params[:id])
    @booking = Booking.new
    @place_coordinates = { latitude: @place.latitude, longitude: @place.longitude }
    @hash = Gmaps4rails.build_markers([@place]) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end
end
