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
    # byebug
    if @training.save
      redirect_to training_path(@training), notice: 'Training is successfully created.'
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
    params.require(:training).permit(:title, :description, :activity)
  end
end
