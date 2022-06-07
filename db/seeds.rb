require "faker"

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
             "Will the entire world one day have adequate health care?"
]
prediction_category = Category.where(category: "Prediction").first
thought_category = Category.where(category: "Thought").first
event_category = Category.where(category: "Event").first
QuestionDay.create(
  question: questions[0],
  theme: "House environmentally friendly",
  date: '2022-06-01',
  category: thought_category
)
QuestionDay.create(
  question: questions[1],
  theme: "The world without oil",
  date: '2022-06-02',
  category: prediction_category
)
QuestionDay.create(
  question: questions[2],
  theme: "Development of China and India",
  date: '2022-06-04',
  category: prediction_category
)
QuestionDay.create(
  question: questions[3],
  theme: "Get married",
  date: '2022-06-03',
  category: event_category
)
QuestionDay.create(
  question: questions[4],
  theme: "Computers taking the world",
  date: '2022-06-05',
  category: prediction_category
)
QuestionDay.create(
  question: questions[5],
  theme: "Consciousness",
  date: '2022-06-06',
  category: thought_category
)
QuestionDay.create(
  question: questions[6],
  theme: "Health care",
  date: '2022-06-07',
  category: prediction_category
)
