class Owner::PlacesController < ApplicationController
  def index
    @places = current_user.places
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to owner_places_path
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :city, :country, :max_capacity, :price, :availability, :description, photos: [])
  end
end
