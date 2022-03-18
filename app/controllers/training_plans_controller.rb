class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: %i[show edit update destroy]

  def index
    @training_plans = current_user.training_plans
    @trainings = @training_plans.map(&:training)
  end

  def show
    @training_plan_exercises = @training_plan.training.exercises
  end

  def new
    @training_plan = TrainingPlan.new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    @training.user = current_user
    @training.save
    @exercise = Exercise.find(params[:training_plan][:exercise_id])
    @training_plan = TrainingPlan.new(exercise: @exercise, training: @training)
    if @training_plan.save
      redirect_to training_plans_path
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

  def training_params
    params.require(:training).permit(:title, :description, :activity)
  end

  def set_training_plan
    @training_plan = TrainingPlan.includes(:training).includes(:exercise).find(params[:id])
  end
end
