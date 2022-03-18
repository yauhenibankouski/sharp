require_relative 'about'
require_relative 'exercises'

puts 'Deleting history'
HistoryLog.destroy_all
puts 'History deleted'

puts 'Deleting messages'
Message.destroy_all
puts 'Messages deleted'

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
User.delete_all
puts 'Users deleted'

def create_user(params)
  User.create!(
    {
      first_name: params[:name],
      last_name: '',
      weight: rand(40..250),
      gender: "M",
      email: "#{params[:name]}@gmail.com",
      password: "123456",
      trainer: params[:trainer],
      about: ABOUT.sample
    }
  )
end

puts '----------------------------------------------------------------'

puts 'Creating 10 users'
@bassem = create_user({ name: 'Bassem', trainer: true })
file = URI.open('https://ca.slack-edge.com/T02NE0241-U02G0FC8WTZ-449cacc71b3c-512')
@bassem.avatar.attach(io: file, filename: "bassem.jpg", content_type: 'image/jpg')

yau = create_user({ name: 'Yauheni' })
wha = create_user({ name: 'Whalton' })
@aris = create_user({ name: 'Aris' })
file = URI.open('https://avatars.githubusercontent.com/u/65190225?v=4')
@aris.avatar.attach(io: file, filename: "aris.jpg", content_type: 'image/jpg')

6.times do
  create_user({ name: Faker::Name.first_name, trainer: true })
end

arnold = create_user({ name: 'Arnold', trainer: true })
file = URI.open('https://www.manify.nl/wp-content/uploads/2020/09/Arnold-Schwarzenegger-manify.jpg')
arnold.avatar.attach(io: file, filename: "arnold.jpg", content_type: 'image/jpg')

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
    client: User.all[-1],
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: User.all[-2],
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: User.all[-3],
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
