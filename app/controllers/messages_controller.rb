class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @message = Message.new(message_params)
    @message.shared_exercise = @shared_exercise
    @message.user = current_user
    if @message.save
      SharedExerciseChannel.broadcast_to(
        @shared_exercise,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to booking_shared_training_plan_shared_exercise_path(@booking, @shared_training_plan, @shared_exercise)
    else
      render "booking/shared_training_plan/shared_exercise/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
