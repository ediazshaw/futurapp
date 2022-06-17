require "faker"
require "csv"
require "open-uri"
require "nokogiri"

filepath = "./db/scrape.csv"

# Here we will create the question of the day.
# Twice a week we will create the same question for every year.
# It will be a thought so they can see how their thoughts about certain personal subjects evolve throught the years.
# The other five days of the week we will ask questions about the future different each day (they may be repeated in
# the future if they are still relevant)
# On specific important dates such as christmas we will have an event as question of the day

####################################################################################################
# Scrapping Questions: There are seven topics of questions. One for each day of the week.
# Introspective question, Unanswerable question, Future question, Preference/Favourite question,
# Trivia Question, AskYourFamily question and Would you Rather question

questions = ["Do you think houses will be more environmentally friendly in the future?",
  "Where will we get our energy when we run out of oil?",
  "How will India and China affect the environment in the future?",
  "Do you want to get married? When will you get married?",
  "Will computers ever take over the world?",
  "Will we ever understand the nature of consciousness?",
  "Conspiracy theory: Are birds real or government drones?"
]

question_introspective_dirt1 = []
question_introspective = []
# Parsing question_introspective
url = "https://bucketlistjourney.net/365-thought-provoking-questions-answered/"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search("h3").each do |element|
  question_introspective_dirt1 << element.text.strip
end
question_introspective_dirt1.pop(2)
question_introspective_dirt1.delete_at(90)
question_introspective_dirt1.each do |elem|
  m = elem.match(/(\d*. ?)(.*)/)
  question_introspective << m[2]
end

question_unanswerable_dirt1 = []
question_unanswerable = []
# Parsing question_unanswerable
url2 = "https://icebreakerideas.com/unanswerable-questions/"
html_file2 = URI.open(url2).read
html_doc2 = Nokogiri::HTML(html_file2)

html_doc2.search("li").each do |element|
  question_unanswerable_dirt1 << element.text.strip
end
# question_unanswerable_dirt1.pop(2)
# question_unanswerable_dirt1.delete_at(90)
# question_unanswerable_dirt1
question_unanswerable_dirt1.each do |elem|
  if elem.include?('?')
    question_unanswerable << elem
  end
end
question_unanswerable.pop(4)

question_future_dirt1 = []
question_future = []
# Parsing question_future
url3 = "https://www.eslconversationquestions.com/future/"
html_file3 = URI.open(url3).read
html_doc3 = Nokogiri::HTML(html_file3)

html_doc3.search("p").each do |element|
  question_future_dirt1 << element.text.strip
end
# question_future_dirt1.pop(2)
# question_future_dirt1.delete_at(90)
# question_future_dirt1
question_future_dirt1.each do |elem|
  if elem.include?('?')
    question_future << elem
  end
end
# question_future.pop(4)

question_future2_dirt1 = []
question_future2 = []
# Parsing question_future2
url4 = "https://www.scientificamerican.com/article/20-big-questions-about-the-future-of-humanity/"
html_file4 = URI.open(url4).read
html_doc4 = Nokogiri::HTML(html_file4)

html_doc4.search("p strong").each do |element|
  question_future2_dirt1 << element.text.strip
end
# question_future2_dirt1.pop(2)
# question_future2_dirt1.delete_at(90)
# question_future2_dirt1
question_future2_dirt1.each do |elem|
  if elem.include?('?')
    m4 = elem.match(/(\d*. ?)(.*)/)
  question_future2 << m4[2]
  end
end
question_future2.pop(1)

question_future3_dirt1 = []
question_future3 = []
# Parsing question_future3
url5 = "http://www.esldiscussiontopics.com/future.html"
html_file5 = URI.open(url5).read
html_doc5 = Nokogiri::HTML(html_file5)

html_doc5.search("li").each do |element|
  question_future3_dirt1 << element.text.strip
end
# question_future3_dirt1.pop(2)
# question_future3_dirt1.delete_at(90)
# question_future3_dirt1
question_future3_dirt1.each do |elem|
  if elem.include?('?')
    question_future3 << elem
  end
end
question_future_total = question_future + question_future2 + question_future3

question_preference_dirt1 = []
question_preference = []
# Parsing question_preference
url6 = "https://blendtw.com/favorite-things-questions/"
html_file6 = URI.open(url6).read
html_doc6 = Nokogiri::HTML(html_file6)

html_doc6.search("li").each do |element|
  question_preference_dirt1 << element.text.strip
  # p element.text.strip
end
# question_preference_dirt1.pop(2)
# question_preference_dirt1.delete_at(90)
question_preference_dirt1.each do |elem|
  if elem.include?('?')
    question_preference << elem
  end
end
question_preference.delete_at(0)
question_preference.delete_at(0)

question_trivia_dirt1 = []
question_trivia = []
# Parsing question_trivia
url7 = "https://www.scarymommy.com/lifestyle/best-trivia-questions-answers/"
html_file7 = URI.open(url7).read
html_doc7 = Nokogiri::HTML(html_file7)

html_doc7.search("p").each do |element|
  question_trivia_dirt1 << element.text.strip
  # p element.text.strip
end
# question_trivia_dirt1.pop(2)
# question_trivia_dirt1.delete_at(90)
question_trivia_dirt1.each do |elem|
  if elem.include?('?')
    m7 = elem.match(/(\d*. ?)(.*\?)/)
  question_trivia << m7[2]
  end
end
question_trivia.delete_at(0)
question_trivia.delete_at(0)

question_family_dirt1 = []
question_family = []
# Parsing question_family
url8 = "https://www.momjunction.com/articles/questions-to-ask-your-grandparents_00762718/"
html_file8 = URI.open(url8).read
html_doc8 = Nokogiri::HTML(html_file8)

html_doc8.search("li").each do |element|
  question_family_dirt1 << element.text.strip
  # p element.text.strip
end
# question_family_dirt1.pop(2)
# question_family_dirt1.delete_at(90)
question_family_dirt1.each do |elem|
  if elem.include?('?')
    question_family << elem
  end
end
# question_family.delete_at(0)
# question_family.delete_at(0)
question_family

question_would_you_rather_dirt1 = []
question_would_you_rather = []
# Parsing question_would_you_rather
url9 = "https://parade.com/964027/parade/would-you-rather-questions/"
html_file9 = URI.open(url9).read
html_doc9 = Nokogiri::HTML(html_file9)

html_doc9.search("p").each do |element|
  question_would_you_rather_dirt1 << element.text.strip
  # p element.text.strip
end
# question_would_you_rather_dirt1.pop(2)
# question_would_you_rather_dirt1.delete_at(90)
question_would_you_rather_dirt1.each do |elem|
  if elem.include?('?')
    m9 = elem.match(/(\d*. ?)(.*)/)
    question_would_you_rather << m9[2]
  end
end
question_would_you_rather.delete_at(0)
question_would_you_rather.delete_at(0)
question_would_you_rather.pop(2)
###############################################################################################################

prediction_category = Category.where(category: "Prediction").first
thought_category = Category.where(category: "Thought").first
event_category = Category.where(category: "Event").first


# question_day = QuestionDay.create(
#   question: question_introspective[0],
#   theme: "Introspection: #{question_introspective[0]}",
#   date: '2022-06-16',
#   category: prediction_category
# )
# file = File.open(Rails.root.join('app/assets/images/category/environmentally.jpg'))
# question_day.photo.attach(io: file, filename: "environmentally.jpg", content_type: 'image/jpg')

# question_day = QuestionDay.create(
#   question: questions[1],
#   theme: "The world without oil",
#   date: '2022-06-17',
#   category: prediction_category
# )
# file = File.open(Rails.root.join('app/assets/images/category/oil.jpg'))
# question_day.photo.attach(io: file, filename: "oil.jpg", content_type: 'image/jpg')

# question_day = QuestionDay.create(
#   question: questions[2],
#   theme: "Development of China and India",
#   date: '2022-06-18',
#   category: prediction_category
# )
# file = File.open(Rails.root.join('app/assets/images/category/development.jpg'))
# question_day.photo.attach(io: file, filename: "development.jpg", content_type: 'image/jpg')

# question_day = QuestionDay.create(
#   question: questions[3],
#   theme: "Get married",
#   date: '2022-06-19',
#   category: event_category
# )
# file = File.open(Rails.root.join('app/assets/images/category/marriage.jpg'))
# question_day.photo.attach(io: file, filename: "marriage.jpg", content_type: 'image/jpg')

# question_day = QuestionDay.create(
  #   question: questions[4],
  #   theme: "Computers taking the world",
  #   date: '2022-06-20',
  #   category: prediction_category
  # )
  # file = File.open(Rails.root.join('app/assets/images/category/computer.jpg'))
  # question_day.photo.attach(io: file, filename: "computer.jpg", content_type: 'image/jpg')

  # question_day = QuestionDay.create(
    #   question: questions[5],
    #   theme: "Consciousness",
    #   date: '2022-06-21',
    #   category: thought_category
    # )
    # file = File.open(Rails.root.join('app/assets/images/category/consciousness.jpg'))
    # question_day.photo.attach(io: file, filename: "consciousness.jpg", content_type: 'image/jpg')

    ##############################################################################################################
    QuestionDay.destroy_all

    # If everything fails this one shows
    question_day = QuestionDay.create(
      question: questions[6],
      theme: "Are birds real?",
      date: '2022-06-10',
      category: thought_category
    )
    file = File.open(Rails.root.join('app/assets/images/category/birds.jpg'))
    question_day.photo.attach(io: file, filename: "birds.jpg", content_type: 'image/jpg')

# Creating questions until 5th or 6th of january
# IMPORTANT ONLY RUN SEEDS ON FRIDAYS OR YOU WILL HAVE TO CHANGE THE CODE FOR DATE
# Mondays
a = 0
question_introspective.first(29).each do |introspective|
  question_day = QuestionDay.create(
    question: introspective,
    theme: "Introspection: #{introspective}",
    date: (Date.today - 4 + a).strftime("%Y-%m-%d"),
    category: thought_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/introspective.jpg'))
  question_day.photo.attach(io: file, filename: "introspective.jpg", content_type: 'image/jpg')
  p "created instrospection question"
  a += 7
end

# Tuesdays
b = 0
question_unanswerable.first(29).each do |unanswerable|
  question_day = QuestionDay.create(
    question: unanswerable,
    theme: "Mistery: #{unanswerable}",
    date: (Date.today - 3 + b).strftime("%Y-%m-%d"),
    category: prediction_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/mistery.jpg'))
  question_day.photo.attach(io: file, filename: "mistery.jpg", content_type: 'image/jpg')
  p "created unanswerable question"
  b += 7
end

# Wednesdays
c = 0
question_future_total.first(29).each do |future_total|
  question_day = QuestionDay.create(
    question: future_total,
    theme: "Mistery: #{future_total}",
    date: (Date.today - 2 + c).strftime("%Y-%m-%d"),
    category: prediction_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/future.jpg'))
  question_day.photo.attach(io: file, filename: "future.jpg", content_type: 'image/jpg')
  p "created future_question_future_total question"
  c += 7
end

# Thrusdays
d = 0
question_preference.first(29).each do |preference|
  question_day = QuestionDay.create(
    question: preference,
    theme: "Preference: #{preference}",
    date: (Date.today - 1 + d).strftime("%Y-%m-%d"),
    category: thought_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/preference.jpg'))
  question_day.photo.attach(io: file, filename: "preference.jpg", content_type: 'image/jpg')
  p "created preference question"

  d += 7
end

# Fridays
g = 0
question_would_you_rather.first(29).each do |would_you_rather|
  question_day = QuestionDay.create(
    question: would_you_rather,
    theme: "Would you Rather: #{would_you_rather}",
    date: (Date.today + g).strftime("%Y-%m-%d"),
    category: thought_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/wyr.png'))
  question_day.photo.attach(io: file, filename: "wyr.png", content_type: 'image/png')
  p "created would_you_rather question"
  g += 7
end

# Saturdays
e = 0
question_trivia.first(29).each do |trivia|
  question_day = QuestionDay.create(
    question: trivia,
    theme: "Trivia: #{trivia}",
    date: (Date.today + 1 + e).strftime("%Y-%m-%d"),
    category: thought_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/trivia.jpg'))
  question_day.photo.attach(io: file, filename: "trivia.jpg", content_type: 'image/jpg')
  p "created trivia question"
  e += 7
end

# Sundays
f = 0
question_family.first(29).each do |family|
  question_day = QuestionDay.create(
    question: "Ask your family: #{family}",
    theme: "Family: #{family}",
    date: (Date.today + 2 + f).strftime("%Y-%m-%d"),
    category: thought_category
  )
  file = File.open(Rails.root.join('app/assets/images/category/family.jpg'))
  question_day.photo.attach(io: file, filename: "family.jpg", content_type: 'image/jpg')
  p "created family question"
  f += 7
end

#############################################################################################################


# puts 'Creating 10 fake users...'

# user1 = User.new(
#   email: "ediazshaw@gmail.com",
#   password: '123456'
# )
# user1.save!
# puts user1.email

# user2 = User.new(
#   email: "joanamenag@gmail.com",
#   password: '123456'
# )
# user2.save!
# puts user2.email

# user3 = User.new(
#   email: "mlutterb@gmail.com",
#   password: '123456'
# )
# user3.save!
# puts user3.email
# puts 'Creating fake data...'
# category = Category.create(category: "Thought")
# category1 = Category.create(category: "Prediction")
# category2 = Category.create(category: "Event")

# puts 'Finished!'

# puts "Creating seeds scraped from LongBets"
# CSV.foreach(filepath, headers: :first_row) do |row|
#   entry = Entry.new(
#     category: Category.all.sample,
#     user: user1,
#     theme: row['theme'],
#     comment: row['comment'],
#     created_at: Faker::Date.between(from: '2022-06-07', to: '2022-06-14'),
#     remember_date: Faker::Date.between(from: '2023-01-01', to: '2023-06-08'),
#     question_day: 0,
#     private: false
#   )
#   entry.save!
# end

# puts "end of seeds from LongBets"
