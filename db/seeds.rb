require "faker"
require "csv"
require "open-uri"

filepath = "./db/scrape.csv"

User.destroy_all
Category.destroy_all

puts 'Creating 10 fake users...'

user1 = User.new(
  email: "ediazshaw@gmail.com",
  password: '123456'
)
user1.save!
puts user1.email

user2 = User.new(
  email: "joanamenag@gmail.com",
  password: '123456'
)
user2.save!
puts user2.email

user3 = User.new(
  email: "mlutterb@gmail.com",
  password: '123456'
)
user3.save!
puts user3.email
puts 'Creating fake data...'
category = Category.create(category: "Thought")
category1 = Category.create(category: "Prediction")
category2 = Category.create(category: "Event")

puts 'Finished!'

entry = Entry.new(
  category: category1,
  user: user1,
  theme: "Nadal Win",
  comment: "Nadal will win more Grand Slams than anyone in history",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category1,
  user: user1,
  theme: "Wordle",
  comment: "We were going to beat Data at wordle every single week",
  created_at: '2022-05-11',
  remember_date: '2022-06-01',
  question_day: 0,
  private: true
)
entry.save!
entry = Entry.new(
  category: category,
  user: user1,
  theme: "Nadal Win",
  comment: "This guy is unbelievable, how can he still play like this being so injured",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!
entry = Entry.new(
  category: category1,
  user: user1,
  theme: "Going to Mars",
  comment: "It is going to be awesome, Elon will be the president and Doeg coin will be the currency",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!


entry = Entry.new(
  category: category1,
  user: user2,
  theme: "Nadal Win",
  comment: "He is too old now, he will not win anymore",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!
entry = Entry.new(
  category: category,
  user: user2,
  theme: "Going to Mars",
  comment: "I think we are not going to get there never to be honest",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!


entry = Entry.new(
  category: category2,
  user: user3,
  theme: "Wedding",
  comment: "It is was the best day of my life but I didn't get to eat anything, I shoud remeber that for  my funeral",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category2,
  user: user2,
  theme: "Wedding",
  comment: "My wedding was great but I have never been more stressed I will help my son for preapering his wedding",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category,
  user: user1,
  theme: "Cristiano Ronaldo",
  comment: "This guy is crazy good but a bit coocky in my opinion",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category,
  user: user3,
  theme: "Cristiano Ronaldo",
  comment: "I wish he was from Brazil",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category2,
  user: user2,
  theme: "Politecnica",
  comment: "This institution is going to die it is so badly organised",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category2,
  user: user1,
  theme: "Politecnica",
  comment: "I dont know how I got out, I thought I was going to be there forever",
  created_at: Faker::Date.between(from: '2022-06-01', to: '2022-06-07'),
  remember_date: Faker::Date.between(from: '2022-06-07', to: '2032-09-25'),
  question_day: 0,
  private: false
)
entry.save!

entry = Entry.new(
  category: category,
  user: user1,
  theme: "Le Wagon",
  comment: "This bootcamp is too hard, there is no way I am gonna graduate",
  created_at: '2022-04-11',
  remember_date: '2022-06-10',
  question_day: 0,
  private: true
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
    user: user1,
    theme: row['theme'],
    comment: row['comment'],
    created_at: Faker::Date.between(from: '2022-06-07', to: '2022-06-14'),
    remember_date: Faker::Date.between(from: '2023-01-01', to: '2023-06-08'),
    question_day: 0,
    private: false
  )
  entry.save!
end

puts "end of seeds from LongBets"
