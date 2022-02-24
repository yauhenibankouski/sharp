class TrainingPlansController < ApplicationController

  def index
  end

  def show
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    if @training_plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def training_plan_params
    params.require(:training_plan).permit(:exercise, :training)
  end
  
end
