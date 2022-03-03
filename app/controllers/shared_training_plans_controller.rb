class SharedTrainingPlansController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    @shared_training_plan = SharedTrainingPlan.new
    @shared_training_plans = SharedTrainingPlan.includes(:training).where(booking: @booking)
    @trainings = @shared_training_plans.map(&:training)
  end

  def show
    @stp = SharedTrainingPlan.includes(:shared_exercise)
                             .includes(:training)
                             .includes(:booking)
                             .where(booking: params[:booking_id], training: params[:id])
                             .first
    @shared_training_plan = SharedTrainingPlan.new
    @booking = @stp.booking
    @training = @stp.training
    @shared_exercises = @stp.training.shared_exercises
    @available_exercises = available_exercises(@shared_exercises)
  end

  def create
    booking = Booking.find(params[:booking_id])
    training = Training.find(params[:shared_training_plan][:training])
    shared_exercise = create_shared_exercise(params)
    @shared_training_plan = SharedTrainingPlan.new(
      {
        training: training, shared_exercise: shared_exercise, booking: booking
      }
    )

    if @shared_training_plan.save
      redirect_to booking_shared_training_plan_path(booking, training)
    else
      render :index
    end
  end

  private

  def shared_training_plan_params
    params.require(:shared_training_plan).permit(:training, :shared_exercise)
  end

  def create_shared_exercise(params)
    exercise = Exercise.find(params[:shared_training_plan][:shared_exercise])
    SharedExercise.create!(
      {
        title: exercise.title,
        description: exercise.description,
        sets: exercise.sets,
        repetitions: exercise.repetitions,
        user: exercise.user,
        exercise: exercise
      }
    )
  end

  def available_exercises(used_exercises)
    current_user.exercises.select do |exercise|
      available_exercise?(used_exercises, exercise)
    end
  end

  def available_exercise?(used_exercises, exercise)
    used_exercises.select do |ex|
      return false if ex.exercise_id == exercise.id
    end
    true
  end
end
