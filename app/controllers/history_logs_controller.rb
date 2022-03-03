class HistoryLogsController < ApplicationController

  def index
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log = HistoryLog.where(shared_exercise: @shared_exercise)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log = HistoryLog.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @history_log = HistoryLog.new(history_log_params)
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log.shared_exercise = @shared_exercise
    if @history_log.save
      redirect_to booking_shared_exercise_path(@booking, @shared_exercise), notice: 'Exercise was successfully created.' # Need to update where to re-direct after exercise creation
    else
      raise
      render :new
    end

  end

  private

  def history_log_params
    params.require(:history_log).permit(:photo,:notes)
  end


end
