class Owner::PlacesController < ApplicationController
  def index
    @places = current_user.places
  end

  def new
    @place = current_user.places.new
  end

  def create
    @place = current_user.places.new(place_params)
    if @place.save
      redirect_to owner_places_path
    else
      render :new
    end
  end

  def edit
    @place = current_user.places.find(params[:id])
  end

  def update
    @place = current_user.places.find(params[:id])
    @place.update(place_params)
    redirect_to owner_places_path
  end

  def destroy
    @place = current_user.places.find(params[:id])
    @place.destroy
    redirect_to owner_places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :city, :country, :max_capacity, :price, :availability, :description, photos: [])
  end
end
