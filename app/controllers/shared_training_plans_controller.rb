class SharedTrainingPlansController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    shared_training_plans = SharedTrainingPlan.where(booking: @booking)
    @trainings = shared_training_plans.map(&:training)
  end

  def new
    @shared_training_plan = SharedTrainingPlan.new
    @booking = Booking.find(params[:booking_id])
  end
end
