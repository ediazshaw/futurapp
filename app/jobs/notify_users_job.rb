class NotifyUsersJob < ApplicationJob
  queue_as :default

  def perform
    @entries = Entry.where(remember_date: (Date.today.beginning_of_day..Date.today.end_of_day))
    @entries.each do |entry|
      UserMailer.entry_notification(entry.id).deliver_later
    end
  end
end
