# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ProgrammingLanguage.create(name: 'Ruby')
ProgrammingLanguage.create(name: 'JavaScript')
ProgrammingLanguage.create(name: 'Python')
ProgrammingLanguage.create(name: 'Java')

puts "Programming languages created"


User.create(
  email: 'heintayzarhm@gmail.com',
  name: 'Hein Tay Zar',
  password: 'password',
)

User.create(
  email: 'heintayzartech@gmail.com',
  name: "hein",
  password: 'password',
)

puts "Users created"


Meeting.create(
  start_time: DateTime.now + 1.day,
  end_time: DateTime.now + 1.day + 45.minutes,
  name: 'Ruby on Rails',
  description: 'Ruby on Rails is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller framework, providing default structures for a database, a web service, and web pages.',
  user_id: 1,
  zoom_link: 'https://zoom.us/j/1234567890',
  invitee_emails_array: ['heintayzartech@gmail.com', 'fake@gmail.com'],
  is_public: true
)

puts "Meeting created"

Invitation.create(
  status: 'pending',
  user_id: 2,
  meeting_id: 1
)
