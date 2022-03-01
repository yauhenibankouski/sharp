class BookingsController < ApplicationController
  def index

  end

  def clients
    @bookings = Booking.where(client: current_user)
    @clients = current_user.bookings.map(&:client)
  end

  def trainers
    @trainers = current_user.bookings.map(&:user)
  end

end
