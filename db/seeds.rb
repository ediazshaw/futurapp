# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts 'Creating 10 fake users...'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
  puts user.email
end

puts 'Creating fake data...'
category = Category.create(category: "Thought")
category1 = Category.create(category: "Prediction")
category2 = Category.create(category: "Event")

20.times do
  entry = Entry.new(
    category: Category.all.sample,
    user: User.all.sample,
    theme: Faker::Book.title,
    comment: Faker::Lorem.paragraphs(number: 5).join(" "),
    remember_date: Faker::Date.between(from: '2014-09-23', to: '2032-09-25'),
    question_day: rand(0..1)
  )
  entry.save
  p entry
end
puts 'Finished!'
