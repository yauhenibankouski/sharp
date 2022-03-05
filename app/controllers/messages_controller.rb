class MessagesController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @shared_exercise = SharedExercise.find(params[:shared_exercise_id])
    @message = Message.new(message_params)
    @message.shared_exercise = @shared_exercise
    @message.user = current_user
    if @message.save
      SharedExerciseChannel.broadcast_to(
        @shared_exercise,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to booking_shared_exercise_path(@booking, @shared_exercise, anchor: "message-#{@message.id}")
    else
      puts "TODO: RENDER USING PROPER ROUTE"
      #render "booking/shared_training_plan/shared_exercise/chatrooms/show"
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
