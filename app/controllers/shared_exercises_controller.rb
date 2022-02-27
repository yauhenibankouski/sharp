class SharedExercisesController < ApplicationController

  # find the booking parsing the url
  #
  def show
    @shared_exercise = SharedExercise.find(params[:id])
  end

end
