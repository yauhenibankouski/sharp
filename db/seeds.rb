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
file = URI.open('https://avatars.githubusercontent.com/u/25736333?v=4')
yau.avatar.attach(io: file, filename: "yauheni.jpg", content_type: 'image/jpg')

wha = create_user({ name: 'Whalton' })
file = URI.open('https://avatars.githubusercontent.com/u/87471833?v=4')
wha.avatar.attach(io: file, filename: "aris.jpg", content_type: 'image/jpg')

@aris = create_user({ name: 'Aris' })
file = URI.open('https://avatars.githubusercontent.com/u/65190225?v=4')
@aris.avatar.attach(io: file, filename: "aris.jpg", content_type: 'image/jpg')

user = create_user({ name: 'Rebecca', trainer: true })
file = URI.open('https://media.istockphoto.com/photos/portrait-of-a-beautiful-woman-at-the-gym-picture-id856797530?k=20&m=856797530&s=612x612&w=0&h=kFFhoXpDoF6jCmerJe-cZzOMKRvpl2orilNip2t3McU=')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

arnold = create_user({ name: 'Arnold', trainer: true })
file = URI.open('https://www.manify.nl/wp-content/uploads/2020/09/Arnold-Schwarzenegger-manify.jpg')
arnold.avatar.attach(io: file, filename: "arnold.jpg", content_type: 'image/jpg')

user = create_user({ name: 'Alex', trainer: true })
file = URI.open('https://media.istockphoto.com/photos/fitness-trainer-at-gym-picture-id1072395722?k=20&m=1072395722&s=612x612&w=0&h=zhxJbv4VDqOqt5JwXI7CgZ0CXfXtagmdtF2mSITW0eo=')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

user = create_user({ name: 'Nick', trainer: true })
file = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/portrait-of-a-trainer-in-gym-royalty-free-image-1584723855.jpg')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

user = create_user({ name: 'Maria', trainer: true })
file = URI.open('https://media.istockphoto.com/photos/portrait-of-a-female-personal-trainer-in-the-gym-picture-id1040495528?k=20&m=1040495528&s=612x612&w=0&h=cu4iGBipe6RvjeEJDOuBTJJuyTNbTeE2kqvFgQhHC7I=')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

user = create_user({ name: 'Jess', trainer: true })
file = URI.open('https://media.istockphoto.com/photos/young-asian-healthy-and-happy-beautiful-fitness-female-athlete-in-picture-id1132187883?k=20&m=1132187883&s=612x612&w=0&h=jLKzGD3lkbWoCwrwjKyyIQVqjaSb7fpDd8nV3dTSAq0=')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

user = create_user({ name: 'John', trainer: true })
file = URI.open('https://www.fitonefour.com/wp-content/uploads/bb-plugin/cache/Personal-Trainer-Adam-Quick-Headshot-scaled-landscape.jpg')
user.avatar.attach(io: file, filename: "#{user.first_name.downcase}.jpg", content_type: 'image/jpg')

puts "Creating trainings"
TRAININGS.each_with_index do |training, i|
  training = Training.create!(
              {
                title: training,
                description: TRAIN_DESC[i],
                activity: "Gym",
                user: @bassem
              }
            )
  link = TRAIN_IMG[i]
  file = URI.open(link)
  training.photo.attach(io: file, filename: "training-#{i}.jpg", content_type: 'image/jpg')
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
  link = EX_IMG[i]
  file = URI.open(link)
  exercise.photo.attach(io: file, filename: "exercise-#{i}.jpg", content_type: 'image/jpg')

  puts 'Creating shared exercises'

  shared = SharedExercise.create!(
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
    client: arnold,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: yau,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: wha,
    status: "Accepted"
  }
)
Booking.create!(
  {
    user: @bassem,
    client: @aris,
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

TrainingPlan.first(8).each_with_index do |tp, i|
  stp = SharedTrainingPlan.create!(
    training: tp.training,
    shared_exercise: SharedExercise.find_by(exercise: tp.exercise),
    booking: @bassem.bookings.first
  )
  if i == 1
    post = HistoryLog.create!(
      notes: 'Different angle.',
      shared_exercise: stp.shared_exercise
    )
    file = URI.open('https://i.pinimg.com/originals/eb/ab/94/ebab945aedca242da2c12e8e04022222.jpg')
    post.photo.attach(io: file, filename: "post-2.jpg", content_type: 'image/jpg')

    post = HistoryLog.create!(
      notes: 'Feeling strong today and upped the weights.',
      shared_exercise: stp.shared_exercise
    )
    file = URI.open('https://miro.medium.com/max/1200/0*FNuZ4XhkYRCDsz38.jpg')
    post.photo.attach(io: file, filename: "post-1.jpg", content_type: 'image/jpg')


    Message.create!(
      content: 'What do you think of my form?',
      shared_exercise: stp.shared_exercise,
      user: arnold
    )
  end
end
