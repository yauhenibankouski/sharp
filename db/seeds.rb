require_relative 'about'
require_relative 'exercises'

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
      about: ABOUT.sample
    }
  )
end

puts '----------------------------------------------------------------'

puts 'Creating 10 users'
create_user('bassem', true)
create_user('yauheni')
create_user('whalton')
create_user('aris')

6.times { create_user(Faker::Name.first_name, true) }

@bassem = User.all[0]
@aris = User.all[3]

puts "Creating trainings"
TRAININGS.each_with_index do |training, i|
  Training.create!(
    {
      title: training,
      description: TRAIN_DESC[i],
      activity: "Gym",
      user: @bassem
    }
  )
end

puts 'Creating exercises'

EXERCISES.each_with_index do |ex_title, i|
  exercise = Exercise.create!(
    {
      user: @bassem,
      title: ex_title,
      description: DESCRIPTION[i],
      technique: TECHNIQUE[i],
      sets: rand(1..6),
      repetitions: rand(6..22)
    }
  )
  puts 'Creating shared exercises'

  SharedExercise.create!(
    user: @bassem,
    description: exercise.description,
    technique: exercise.technique,
    title: exercise.title,
    sets: exercise.sets,
    repetitions: exercise.repetitions,
    exercise: exercise
  )
end

puts "Creating 4 bookings"

Booking.create!(
  {
    user: @bassem,
    client: @aris,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: User.all[1],
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: User.all[6],
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: User.all[2],
    status: "Accepted"
  }
)

Exercise.all.each_with_index do |ex, i|
  if i < 4
    TrainingPlan.create!(
      {
        training: Training.all[0],
        exercise: ex
      }
    )
  elsif i >= 4 && i < 8
    TrainingPlan.create!(
      {
        training: Training.all[1],
        exercise: ex
      }
    )
  elsif i >= 8 && i < 12
    TrainingPlan.create!(
      {
        training: Training.all[2],
        exercise: ex
      }
    )
  else
    TrainingPlan.create!(
      {
        training: Training.all[3],
        exercise: ex
      }
    )
  end
end

TrainingPlan.first(8).each do |tp|
  SharedTrainingPlan.create!(
    training: tp.training,
    shared_exercise: SharedExercise.find_by(exercise: tp.exercise),
    booking: @bassem.bookings.first
  )
end
