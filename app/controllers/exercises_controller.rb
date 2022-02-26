class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @exercises = current_user.exercises
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    if @exercise.save
      redirect_to @exercise, notice: 'Exercise was successfully created.' # Need to update where to re-direct after exercise creation
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @exercise.update(exercise_params)
      redirect_to @exercise, notice: 'Exercise was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path, notice: 'Exercise was successfully deleted.'
  end

  private

  def exercise_params
    params.require(:exercise).permit(:title, :description, :technique, :sets, :repetitions)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
