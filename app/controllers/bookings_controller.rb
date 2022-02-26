class BookingsController < ApplicationController
  def index
  end

  def clients
    bookings = current_user.bookings
    @clients = bookings.map { |booking| booking.client }
  end

  def trainers
    bookings = Booking.where(client: current_user)
    @trainers = bookings.map { |booking| booking.user }
  end
end
