class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      @clients = current_user.bookings.map(&:client)
      @trainers = Booking.where(client: current_user).map(&:user)
    end
  end
end
