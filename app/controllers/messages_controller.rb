class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @booking = Booking.find(params[:booking_id])
    @shared_training_plan = SharedTrainingPlan.find(params[:shared_training_plan_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to booking_shared_training_plan_chatroom_path(@booking, @shared_training_plan, @chatroom, anchor: "message-#{@message.id}")
    else
      render "booking/shared_training_plan/chatrooms/show"
     end
  end
  
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
