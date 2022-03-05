class SharedExerciseChannel < ApplicationCable::Channel
  def subscribed
    shared_exercise = SharedExercise.find(params[:id])
    stream_for shared_exercise
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
