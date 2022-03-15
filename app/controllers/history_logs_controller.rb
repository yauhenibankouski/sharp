class HistoryLogsController < ApplicationController

  def index
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @history_log = HistoryLog.where(shared_exercise: @shared_exercise)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log = HistoryLog.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @history_log = HistoryLog.new(history_log_params)
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log.shared_exercise = @shared_exercise
    if @history_log.save
      redirect_to booking_shared_training_plan_shared_exercise_history_logs_path, notice: 'Exercise was successfully created.'
      # redirect_to booking_shared_training_plan_shared_exercise_path(@booking, @shared_training_plan, @shared_exercise), notice: 'Exercise was successfully created.'
    else
      render :new
    end

  end

  private

  def history_log_params
    params.require(:history_log).permit(:photo,:notes)
  end


end
