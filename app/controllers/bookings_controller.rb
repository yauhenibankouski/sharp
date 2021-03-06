class BookingsController < ApplicationController
  def index
    @available_trainers = User.includes(:bookings).where(trainer: true).where.not(id: current_user.id)
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 'Pending'
    if @booking.save
      @pending_bookings = @booking.user.bookings.select { |booking| booking.status == 'Pending' }
      @rejected_bookings = @booking.user.bookings.select { |booking| booking.status == 'Rejected' }
      # BookingChannel.broadcast_to(
      #   @booking.user,
      #   render_to_string(partial: "booking", locals: { pending_bookings: @pending_bookings, rejected_bookings: @rejected_bookings })
      # )
      redirect_to bookings_path
    else
      render :index
    end
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      @available_trainers = User.includes(:bookings).where(trainer: true).where.not(id: @booking.client.id)
      # BookingChannel.broadcast_to(
      #   @booking.client,
      #   render_to_string(partial: "booking_form",
      #                    locals: { available_trainers: @available_trainers, user: @booking.client })
      # )
      redirect_to clients_bookings_path
    else
      redirect_to clients_bookings_path, notice: "Oops, something went wrong."
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    @pending_bookings = @booking.user.bookings.select { |booking| booking.status == 'Pending' }
    @rejected_bookings = @booking.user.bookings.select { |booking| booking.status == 'Rejected' }

    # BookingChannel.broadcast_to(
    #   @booking.user,
    #   render_to_string(partial: "booking", locals: { pending_bookings: @pending_bookings, rejected_bookings: @rejected_bookings })
    # )
    redirect_to bookings_path
  end

  def clients
    @bookings = current_user.bookings
    @accepted_bookings = @bookings.where(status: 'Accepted')
    @pending_bookings = @bookings.where(status: 'Pending')
    @rejected_bookings = @bookings.where(status: 'Rejected')
  end

  def trainers
    @bookings = Booking.where(client: current_user)
  end

  def all_exercises
    @bookings = Booking.where(client: current_user)
    @shared_training_plans = SharedTrainingPlan.includes(:booking)
                                               .includes(:shared_exercise)
                                               .select { |stp| @bookings.include?(stp.booking) }
    @exercises = current_user.exercises
    return unless params[:query].present?

    results = SharedExercise.search_by_title_and_description(params[:query])
    @shared_training_plans = @shared_training_plans.select { |stp| results.include?(stp.shared_exercise) }

    @exercises = Exercise.search_by_title_and_description(params[:query])
                         .select { |exercise| exercise.user == current_user }
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :client_id, :status)

  end
end
