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
        
    }
)