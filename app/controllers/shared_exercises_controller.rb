class SharedExercisesController < ApplicationController

  # find the booking parsing the url
  #
  def show
    @exercise = SharedExercise.find(params[:id])
  end

end
