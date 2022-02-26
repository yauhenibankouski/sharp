class BookingsController < ApplicationController
  def index
  end

  def clients
    @clients = current_user.bookings.map(&:client)
  end

  def trainers
    bookings = Booking.where(client: current_user)
    @trainers = bookings.map(&:user)
  end
end
