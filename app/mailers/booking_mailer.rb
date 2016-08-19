class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.create.subject
  #
   def create(booking)
    @booking = booking

    mail(
      to:       @booking.place.user.email,
      subject:  "You have a new booking at #{@booking.place.name}"
    )
  end
end
