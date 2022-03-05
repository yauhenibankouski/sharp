class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @booking = Booking.find(params[:id])
    @shared_exercise = SharedExercise.find(params[:id])
    @chatroom = Chatroom.find(params[:id])
  end

end
