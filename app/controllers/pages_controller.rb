class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @clients = current_user.bookings.map(&:client)
    @trainers = Booking.where(client: current_user).map(&:user)
    # raise
  end
end
