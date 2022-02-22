class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    if @exercise.save
      redirect_to root_path # Need to update where to re-direct after exercise creation
    else
      render :new
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:title, :description, :technique, :sets, :repetitions)
  end
end
