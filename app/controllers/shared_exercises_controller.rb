class SharedExercisesController < ApplicationController

  # find the booking parsing the url
  #
  def show
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:id])
  end

end
