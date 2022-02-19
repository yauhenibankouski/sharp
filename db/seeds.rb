# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting users'
User.delete_all
puts 'Users deleted'

puts 'Deleting trainings'
Training.delete_all
puts 'Trainings deleted'

puts '----------------------------------------------------------------'

puts 'Creating 4 users'
4.times do |i|
  puts "Creating user #{i + 1}"
  user = User.new(
    {
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
      title: "Chest Workout"
      description: "Intensive training of Pectoralis major and minor, Serratus anterior, and the Subclavius"
      activity: "Gym"
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
      title: "Shoulder Workout Routine"
      description: "Try this tri-set deltoids workout to grow bigger, stronger and wider shoulders"
      activity: "Gym"
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
      title: "Shoulder Workout Routine"
      description: "Try this tri-set deltoids workout to grow bigger, stronger and wider shoulders"
      activity: "Gym"
    }
)
if training3.save
  puts "Training  #{training3.id} saved!"
else
  puts "XXXXXXXXXXXX"
  puts "Issue with training #{training3.id}"
  puts "XXXXXXXXXXXX"
end

