namespace :users do
  desc "Send a recordatory mail when the remember date arriveS"
  task notify_mail: :environment do
    puts "starting..."
    @entries = Entry.where(remember_date: (Date.today.beginning_of_day..Date.today.end_of_day))
    @entries.each do |entry|
      UserMailer.entry_notification(entry.id).deliver_later
    end
    puts "sent..."
  end
end
