# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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

puts '----------------------------------------------------------------'

puts 'Creating 10 users'
10.times do |i|
  puts "Creating user #{i + 1}"
  user = User.new(
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      weight: rand(40..250),
      gender: "M" || "F",
      email: Faker::Internet.email,
      password: (0...8).map { (65 + rand(26)).chr }.join
    }
  )
  if user.save
    puts "User #{i + 1} saved!"
  else
    puts "XXXXXXXXXXXXXX"
    puts "Issue with user #{i + 1}"
    puts "XXXXXXXXXXXXXX"
  end
end

puts "Creating 6 trainings"

training1 = Training.new(
  {
    title: "Chest Workout",
    description: "Intensive training of Pectoralis major and minor, Serratus anterior, and the Subclavius",
    activity: "Gym",
    user: User.all.sample
  }
)
if training1.save
  puts "Training  #{training1.id} saved!"
else
  puts "XXXXXXXXXXXX"
  puts "Issue with training #{training1.id}"
  puts "XXXXXXXXXXXX"
end
training2 = Training.new(
  {
    title: "Shoulder Workout Routine",
    description: "Try this tri-set deltoids workout to grow bigger, stronger and wider shoulders",
    activity: "Gym",
    user: User.all.sample
  }
)
if training2.save
  puts "Training  #{training2.id} saved!"
else
  puts "XXXXXXXXXXXX"
  puts "Issue with training #{training2.id}"
  puts "XXXXXXXXXXXX"
end
training3 = Training.new(
  {
    title: "Shoulder Workout Routine",
    description: "Try this tri-set deltoids workout to grow bigger, stronger and wider shoulders",
    activity: "Gym",
    user: User.all.sample
  }
)
if training3.save
  puts "Training  #{training3.id} saved!"
else
  puts "XXXXXXXXXXXX"
  puts "Issue with training #{training3.id}"
  puts "XXXXXXXXXXXX"
end
training4 = Training.new(
  {
    title: "Mindfulness Yoga",
    description: "This class incorporates yoga postures, gentle movement sequences, breath work, supported silent meditation, and guided relaxation to support increased awareness and mindfulness of the breath and body, and quieting of the nervous system.",
    activity: "Yoga",
    user: User.all.sample
  }
)
if training4.save
  puts "Training #{training4.id} saved!"
else
  puts "XXXXXXXXXXXX"
  puts "Issue with training #{training4.id}"
  puts "XXXXXXXXXXXX"
end

puts 'Creating 10 exercises'

@user = User.all.sample
titles_array = ['Lunges', 'dumbbell press', 'Dumbbell rows', 'Single-leg deadlifts', 'Squats', 'Push-ups', 'Abdominal Crunches', 'Bent-over Row', 'Bench Press', 'Side Planks']
description_array = ['2 minutes rest between each repetition', '1 minutes rest between each repetition', 'keep your back straight']
titles_array.each_with_index do |title, i|
  puts "Creating exercise #{i + 1}"
  exercise = Exercise.new(
    {
      user: @user,
      title: title,
      description: description_array.sample,
      technique: description_array.sample,
      sets: rand(1..6),
      repetitions: rand(6..22)
    }
  )
  if exercise.save
    puts "Exercise #{exercise.id} saved!"
  else
    puts "XXXXXXXXXXXXXXXXXXXXX"
    puts "Issue with exercise #{exercise.id}"
    puts "XXXXXXXXXXXXXXXXXXXXX"
  end

  puts 'Creating shared exercises'

  shared_exercise = SharedExercise.new(
    user: @user,
    description: exercise.description,
    title: exercise.title,
    sets: rand(1..6),
    repetitions: rand(6..22)
  )
  if shared_exercise.save
    puts "Shared exercise #{shared_exercise.id} saved!"
  else
    puts "XXXXXXXXXXXXXXXXXXXXX"
    puts "Issue with shared exercise #{shared_exercise.id}"
    puts "XXXXXXXXXXXXXXXXXXXXX"
  end
end

puts "Creating 2 bookings"

2.times do |i|
  puts "Creating booking #{i + 1}"

  booking = Booking.new(
    {
      user: @user,
      client: User.all.reject { |user| user == @user}.sample,
      status: "Accepted"
    }
  )
  if booking.save
    puts "Booking #{i + 1} saved!"
  else
    puts "XXXXXXXXXXXXXX"
    puts "Issue with booking #{i + 1}"
    puts "XXXXXXXXXXXXXX"
  end
end

puts "Creating 10 training plans"

10.times do |i|
  puts "Creating training plan #{i+1}"

  training_plan = TrainingPlan.new(
    {
      training: Training.all.sample,
      exercise: Exercise.all.sample,
    }
  )
  if training_plan.save
    puts "Training plan #{i+1} saved!"
  else
    puts "XXXXXXXXXXXXXX"
    puts "Issue with training plan #{i + 1}"
    puts "XXXXXXXXXXXXXX"
  end
end

puts "Creating shared training plan"

shared_training_plan = SharedTrainingPlan.new(
  training: Training.all.sample,
  shared_exercise: SharedExercise.all.sample,
  booking: Booking.all.sample
)

if shared_training_plan.save
  puts "Shared training plan #{shared_training_plan.id} saved!"
else
  puts "XXXXXXXXXXXXXXXXXXXXX"
  puts "Issue with shared training plan #{shared_training_plan.id}"
  puts "XXXXXXXXXXXXXXXXXXXXX"
end
