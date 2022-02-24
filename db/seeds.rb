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

def create_user(name)
  User.create!(
    {
      first_name: name,
      last_name: '-',
      weight: rand(40..250),
      gender: "M",
      email: "#{name}@test.com",
      password: "123456"
    }
  )
end

puts '----------------------------------------------------------------'

puts 'Creating 4 users'
create_user('yauheni')
create_user('whalton')
create_user('bassem')
create_user('aris')

puts "Creating 4 trainings"
@user1 = User.first
@user2 = User.last

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

Training.new(
  {
    title: "Mindfulness Yoga",
    description: "This class incorporates yoga postures, gentle movement sequences, breath work, supported silent meditation, and guided relaxation to support increased awareness and mindfulness of the breath and body, and quieting of the nervous system.",
    activity: "Yoga",
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
    repetitions: rand(6..22)
  )
end

puts "Creating 2 bookings"

Booking.create!(
  {
    user: @user1,
    client: User.all.reject { |user| user == @user1 }.sample,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @user2,
    client: User.all.reject { |user| user == @user2 }.sample,
    status: "Accepted"
  }
)

puts "Creating 10 training plans"

10.times do |i|
  puts "Creating training plan #{i + 1}"

  TrainingPlan.create!(
    {
      training: Training.all.sample,
      exercise: Exercise.all.sample,
    }
  )
end

puts "Creating 7 shared training plans"
7.times do
  SharedTrainingPlan.create!(
    training: Training.all.sample,
    shared_exercise: SharedExercise.all.sample,
    booking: Booking.all.sample
  )
end
