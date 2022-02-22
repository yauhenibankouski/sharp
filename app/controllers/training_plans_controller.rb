class TrainingPlansController < ApplicationController

  def new
    @training_plan = TrainingPlan.new
  end

  def create
    @training_plan = TrainingPlan.new(training_plan_params)
    @training_plan.exercise = 
    @training_plan.training =
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
