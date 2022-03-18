class TrainingsController < ApplicationController

  def index
    @trainings = current_user.trainings
  end

  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user
    @exercise = Exercise.find(params[:training][:exercises])
    @training_plan = TrainingPlan.new(exercise: @exercise, training: @training)
    if @training.save && @training_plan.save
      redirect_to training_plan_path(@training_plan), notice: 'Training plan successfully created.'
    else
      render :new
    end
  end

  def edit
    @training= Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    @training.update(training_params)
    redirect_to training_path(@training)
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(:title, :description, :activity, :photo)
  end
end
