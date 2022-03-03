class SharedExercisesController < ApplicationController
  def show
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @history_log = HistoryLog.new
    # raise
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:id])
    training = @shared_exercise.shared_training_plans.first.training
    SharedTrainingPlan.find_by(booking: @booking, shared_exercise: @shared_exercise).delete
    @shared_exercise.destroy
    redirect_to booking_shared_training_plan_path(@booking, training.id)
  end
end
