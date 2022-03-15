class SharedExercisesController < ApplicationController
  def show
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @history_log = HistoryLog.new
    @message = Message.new
    @messages = @shared_exercise.messages.order(created_at: :desc)
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @shared_exercise = SharedExercise.find(params[:id])
  end

  def update
    @shared_exercise = SharedExercise.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    if @shared_exercise.update(shared_exercise_params)
      redirect_to booking_shared_training_plan_shared_exercise_path(@booking, @shared_training_plan, @shared_exercise)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:id])
    @shared_training_plan = SharedTrainingPlan.find_by(booking: @booking, shared_exercise: @shared_exercise)
    @shared_training_plan.destroy
    stp = SharedTrainingPlan.find_by(booking: @booking)
    redirect_to booking_shared_training_plan_path(@booking, stp)
  end

  private

  def shared_exercise_params
    params.require(:shared_exercise).permit(:description, :technique, :sets, :repetitions, :photo)
  end
end
