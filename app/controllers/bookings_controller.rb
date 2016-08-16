class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end
  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    # Get hidden field from places#show
    # Form value is sending booking[:field] cause of @booking
    @place = Place.find(params[:booking][:place_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.user = @user
    @booking.status = 0
    @booking.save
    redirect_to root_path
    raise
  end

  def edit
  end
  def update
  end

  def destroy
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :duration, :number_of_participants, :place_id)
  end
end


