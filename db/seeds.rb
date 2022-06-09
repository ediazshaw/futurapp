require "faker"
require "csv"
require "open-uri"

filepath = "./db/scrape.csv"

User.destroy_all
Category.destroy_all

puts 'Creating 10 fake users...'

9.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
  puts user.email
end
user1 = User.new(
  email: "test@mail.com",
  password: '123456'
)
user1.save!
puts user1.email

user2 = User.new(
  email: "edu@diaz.com",
  password: '123456'
)
user2.save!
puts user2.email
puts 'Creating fake data...'
category = Category.create(category: "Thought")
category1 = Category.create(category: "Prediction")
category2 = Category.create(category: "Event")

40.times do
  entry = Entry.new(
    category: Category.all.sample,
    user: User.all.sample,
    theme: Faker::Book.title,
    comment: Faker::Lorem.paragraphs(number: 5).join(" "),
    created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
    remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
    question_day: rand(0..1),
    private: rand(0..1)
  )
  entry.save!
  p entry
end
puts 'Finished!'

10.times do
  entry = Entry.new(
    category: Category.all.sample,
    user: user1,
    theme: Faker::Book.title,
    comment: Faker::Lorem.paragraphs(number: 5).join(" "),
    created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
    remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
    question_day: rand(0..1),
    private: rand(0..1)
  )
  entry.save!
  p entry
end
entry = Entry.new(
  category: Category.all.sample,
  user: user1,
  theme: "Nadal Win",
  comment: Faker::Lorem.paragraphs(number: 5).join(" "),
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: rand(0..1),
  private: false
)
entry.save!
entry = Entry.new(
  category: Category.all.sample,
  user: user1,
  theme: "Nadal Win",
  comment: Faker::Lorem.paragraphs(number: 5).join(" "),
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: rand(0..1),
  private: false
)
entry.save!
entry = Entry.new(
  category: Category.all.sample,
  user: user1,
  theme: "Going to Mars",
  comment: Faker::Lorem.paragraphs(number: 5).join(" "),
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: rand(0..1),
  private: false
)
entry.save!
10.times do
  entry = Entry.new(
    category: Category.all.sample,
    user: user2,
    theme: Faker::Book.title,
    comment: Faker::Lorem.paragraphs(number: 5).join(" "),
    created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
    remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
    question_day: rand(0..1),
    private: rand(0..1)
  )
  entry.save!
  p entry
end
entry = Entry.new(
  category: Category.all.sample,
  user: user2,
  theme: "Nadal Win",
  comment: Faker::Lorem.paragraphs(number: 5).join(" "),
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: rand(0..1),
  private: false
)
entry.save!
entry = Entry.new(
  category: Category.all.sample,
  user: user2,
  theme: "Going to Mars",
  comment: Faker::Lorem.paragraphs(number: 5).join(" "),
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: rand(0..1),
  private: false
)
entry.save!
QuestionDay.destroy_all
questions = ["Do you think houses will be more environmentally friendly in the future?",
             "Where will we get our energy when we run out of oil?",
             "How will India and China affect the environment in the future?",
             "Do you want to get married? When will you get married?",
             "Will computers ever take over the world?",
             "Will we ever understand the nature of consciousness?",
             "Conspiracy theory: Are birds real or government drones?"
]
prediction_category = Category.where(category: "Prediction").first
thought_category = Category.where(category: "Thought").first
event_category = Category.where(category: "Event").first

question_day = QuestionDay.create(
  question: questions[0],
  theme: "House environmentally friendly",
  date: '2022-06-09',
  category: prediction_category
)
file = File.open(Rails.root.join('app/assets/images/category/environmentally.jpg'))
question_day.photo.attach(io: file, filename: "environmentally.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[1],
  theme: "The world without oil",
  date: '2022-06-04',
  category: prediction_category
)
file = File.open(Rails.root.join('app/assets/images/category/oil.jpg'))
question_day.photo.attach(io: file, filename: "oil.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[2],
  theme: "Development of China and India",
  date: '2022-06-05',
  category: prediction_category
)
file = File.open(Rails.root.join('app/assets/images/category/development.jpg'))
question_day.photo.attach(io: file, filename: "development.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[3],
  theme: "Get married",
  date: '2022-06-06',
  category: event_category
)
file = File.open(Rails.root.join('app/assets/images/category/marriage.jpg'))
question_day.photo.attach(io: file, filename: "marriage.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[4],
  theme: "Computers taking the world",
  date: '2022-06-07',
  category: prediction_category
)
file = File.open(Rails.root.join('app/assets/images/category/computer.jpg'))
question_day.photo.attach(io: file, filename: "computer.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[5],
  theme: "Consciousness",
  date: '2022-06-08',
  category: thought_category
)
file = File.open(Rails.root.join('app/assets/images/category/consciousness.jpg'))
question_day.photo.attach(io: file, filename: "consciousness.jpg", content_type: 'image/jpg')

question_day = QuestionDay.create(
  question: questions[6],
  theme: "Are birds real?",
  date: '2022-06-10',
  category: thought_category
)
file = File.open(Rails.root.join('app/assets/images/category/birds.jpg'))
question_day.photo.attach(io: file, filename: "birds.jpg", content_type: 'image/jpg')

puts "Creating seeds scraped from LongBets"
CSV.foreach(filepath, headers: :first_row) do |row|
  entry = Entry.new(
    category: Category.all.sample,
    user: user2,
    theme: row['theme'],
    comment: row['comment'],
    created_at: Faker::Date.between(from: '2022-06-07', to: '2022-06-10'),
    remember_date: Faker::Date.between(from: '2023-01-01', to: '2023-06-08'),
    question_day: 0,
    private: false
  )
  entry.save!
end
puts "end of seeds from LongBets"
