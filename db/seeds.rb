puts 'Deleting training plans'
TrainingPlan.destroy_all
puts 'Training plans deleted'

puts 'SharedTrainingPlan'
SharedTrainingPlan.destroy_all
puts 'shared training_plan deleted'

puts 'Deleting SharedExercises'
SharedExercise.destroy_all
puts 'shared exercises deleted'

puts 'Deleting trainings'
Training.destroy_all
puts 'Trainings deleted'

puts 'Deleting Exercises'
Exercise.destroy_all
puts 'exercises deleted'

puts 'Deleting bookings'
Booking.destroy_all
puts 'Bookings deleted'

puts 'Deleting users'
User.destroy_all
puts 'Users deleted'

def create_user(name, boolean = false)
  User.create!(
    {
      first_name: name,
      last_name: '',
      weight: rand(40..250),
      gender: "M",
      email: "#{name}@test.com",
      password: "123456",
      trainer: boolean,
      about: "I care deeply about my clients, and there's nothing of more value to me than helping somebody go through
      an experience that makes them happy, confident, and strong. I realize how being overweight affects many aspects
      of your life, and I want to be there for you and help you discover the benefits and joys of training that helped
      me become the person I am today. I'm here to be your personal guide on every step of the journey."
    }
  )
end

puts '----------------------------------------------------------------'

puts 'Creating 4 users'
create_user('yauheni', true)
create_user('whalton', true)
create_user('bassem')
create_user('aris')

puts "Creating 4 trainings"
@user1 = User.all[0]
@user2 = User.all[1]
@user3 = User.all[2]
@user4 = User.all[3]

Training.create!(
  {
    title: "Chest Workout",
    description: "Intensive training of Pectoralis major and minor, Serratus anterior, and the Subclavius",
    activity: "Gym",
    user: @user1
  }
)

Training.create!(
  {
    title: "Back Workout Routine",
    description: "Try this back workout to grow bigger, stronger and wider back",
    activity: "Gym",
    user: @user1
  }
)

Training.create!(
  {
    title: "Shoulder Workout Routine",
    description: "Try this tri-set deltoids workout to grow bigger, stronger and wider shoulders",
    activity: "Gym",
    user: @user2
  }
)

Training.create!(
  {
    title: "Maximum Mass Workout",
    description: "A mass building routine that features a great combination of effective compound
    and isolation movements along with intense, high impact five minute burn sets.",
    activity: "Gym",
    user: @user2
  }
)

puts 'Creating 10 exercises'

titles_array = ['Lunges', 'dumbbell press', 'Dumbbell rows', 'Single-leg deadlifts', 'Squats', 'Push-ups', 'Abdominal Crunches', 'Bent-over Row', 'Bench Press', 'Side Planks']
description_array = ['2 minutes rest between each repetition', '1 minutes rest between each repetition', 'keep your back straight']

titles_array.each_with_index do |title, i|
  puts "Creating exercise #{i + 1}"
  user = [@user1, @user2].sample
  exercise = Exercise.create!(
    {
      user: user,
      title: title,
      description: description_array.sample,
      technique: description_array.sample,
      sets: rand(1..6),
      repetitions: rand(6..22)
    }
  )

  puts 'Creating shared exercises'

  SharedExercise.create!(
    user: user,
    description: exercise.description,
    title: exercise.title,
    sets: rand(1..6),
    repetitions: rand(6..22),
    exercise: exercise
  )
end

puts "Creating 2 bookings"

Booking.create!(
  {
    user: @user1,
    client: @user3,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @user2,
    client: @user4,
    status: "Accepted"
  }
)

TrainingPlan.create!(
  {
    training: @user1.trainings.first,
    exercise: @user1.exercises.sample
  }
)

TrainingPlan.create!(
  {
    training: @user1.trainings.last,
    exercise: @user1.exercises.sample
  }
)

TrainingPlan.create!(
  {
    training: @user2.trainings.first,
    exercise: @user2.exercises.sample
  }
)

TrainingPlan.create!(
  {
    training: @user2.trainings.last,
    exercise: @user2.exercises.sample
  }
)

SharedTrainingPlan.create!(
    training: @user1.trainings.sample,
    shared_exercise: @user1.shared_exercises.sample,
    booking: Booking.where(user: @user1).sample
  )

SharedTrainingPlan.create!(
    training: @user2.trainings.sample,
    shared_exercise: @user2.shared_exercises.sample,
    booking: Booking.where(user: @user2).sample
  )
