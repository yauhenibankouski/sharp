class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @booking = Booking.find(params[:id])
    @shared_training_plan = SharedTrainingPlan.find(params[:id])
    @chatroom = Chatroom.find(params[:id])
  end

end
