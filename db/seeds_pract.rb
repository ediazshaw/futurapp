require "open-uri"
require "nokogiri"

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
question_would_you_rather
