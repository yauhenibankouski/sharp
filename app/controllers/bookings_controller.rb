class BookingsController < ApplicationController
  def index
    @available_trainers = User.includes(:bookings).where(trainer: true).where.not(id: current_user.id)
  end

  def clients
    bookings = current_user.bookings
    @clients = bookings.map(&:client)
  end

  def trainers
    bookings = Booking.where(client: current_user)
    @trainers = bookings.map(&:user)
  end
end
