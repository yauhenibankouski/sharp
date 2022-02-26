class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: %i[show edit update destroy ]

  def index
    @training_plans = TrainingPlan.all
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

  def edit
  end

  def update
    if @training_plan.update(training_plan_params)
      redirect_to @training_plan, notice: 'Training plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @training_plan.destroy
    redirect_to training_plans_path, notice: 'Training plan was successfully deleted.'
  end

  private

  def training_plan_params
    params.require(:training_plan).permit(:exercise, :training)
  end
  
  def set_training_plan
    @training_plan = TrainingPlan.find(params[:id])
  end

end
