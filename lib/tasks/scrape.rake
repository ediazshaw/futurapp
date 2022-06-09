namespace :scrape do
  desc "Scraping real bets description from LongBets"
  task scrape_longbets: :environment do
    require "open-uri"
    require "nokogiri"
    require "csv"

    longbets_array = []
    30.times do |index|
      url = "https://longbets.org/#{index+850}/"
      puts url

      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML(html_file)
      longbets_array << [html_doc.search("h1").text.split.first(8).join(' '), html_doc.search(".argument p").first.text]
    rescue
      next
    end
    filepath = "db/scrape.csv"
    CSV.open(filepath, "wb") do |csv|
      csv << ["theme", "comment"]
      longbets_array.each do |bet|
        puts bet
        csv << bet
      end
    end
  end
end
