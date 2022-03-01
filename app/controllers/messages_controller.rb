class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:booking_id][:shared_training_plans_id][:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to bookings_shared_training_plans_chatroom_path(@chatroom, anchor: "message-#{message.id}")
    else
      render "../chatrooms/show"
  end
  
end
