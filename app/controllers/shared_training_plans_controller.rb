class SharedTrainingPlansController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    shared_training_plans = SharedTrainingPlan.where(booking: @booking)
    @trainings = shared_training_plans.map(&:training)
    # raise
  end

  def new
    @shared_training_plan = SharedTrainingPlan.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    booking = Booking.find(params[:booking_id])
    training = Training.find(params[:shared_training_plan][:training])
    shared_exercise = create_shared_exercise(params)

    @shared_training_plan = SharedTrainingPlan.new({ training: training, shared_exercise: shared_exercise, booking: booking })

    if @shared_training_plan.save
      redirect_to booking_shared_training_plans_path(booking)
    else
      render :new
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
        user: exercise.user
      }
    )
  end
end
