class HistoryLogsController < ApplicationController

  def index
    @history_log = current_user.exercises
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @history_log = HistoryLog.new
  end

  def create
    @history_log = HistoryLog.new(history_log_params)
    if @history_log.save
      redirect_to @history_log, notice: 'Exercise was successfully created.' # Need to update where to re-direct after exercise creation
    else
      render :new
    end

  end

  private

  def history_log_params
    params.require(:history_log).permit(:content)
  end


end
