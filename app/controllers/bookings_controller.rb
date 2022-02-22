class BookingsController < ApplicationController
  def index
  end

  def clients
    @clients = current_user.bookings
  end

  def trainers
    @trainers = Booking.where(client: current_user)
  end
end
