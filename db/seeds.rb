# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleting Exercises'
Exercise.delete_all
puts 'exercises deleted'

puts 'Deleting SharedExercises'
SharedExercise.delete_all
puts 'shared exercises deleted'

puts 'Deleting trainings'
Training.delete_all
puts 'Trainings deleted'

puts 'Deleting users'
User.delete_all
puts 'Users deleted'

puts '----------------------------------------------------------------'

puts 'Creating 4 users'
4.times do |i|
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

titles_array = ['Lunges', 'dumbbell press', 'Dumbbell rows', 'Single-leg deadlifts', 'Squats', 'Push-ups', 'Abdominal Crunches', 'Bent-over Row', 'Bench Press', 'Side Planks']
technique_array = ['2 minutes rest between each repetition', '1 minutes rest between each repetition', 'keep your back straight']
titles_array.each_with_index do |title, i|
  puts "Creating exercise #{i + 1}"
  exercise = Exercise.new(
    {
      user: User.all.sample,
      title: title,
      description: 'So especially if you are a beginner, it is a good idea to seek the advice of a fitness trainer - whether it is a personal trainer or a trainer at your gym -- to be sure your form is safe and correct.',
      technique: technique_array.sample,
      sets: rand(1..6),
      repetitions: rand(6..22)
    }
  )

  puts 'Creating shared exercises'

  SharedExercise.create!(
    user: User.all.sample,
    description: 'So especially if you are a beginner, it is a good idea to seek the advice of a fitness trainer - whether it is a personal trainer or a trainer at your gym -- to be sure your form is safe and correct.',
    title: exercise.title,
    sets: rand(1..6),
    repetitions: rand(6..22)
  )
end
