class UserMailer < ApplicationMailer
  def entry_notification(entry_id)
    @entry = Entry.find(entry_id)
    mail(
      to: @entry.user.email,
      subject: "You have a memory to visit"
    )
  end
  
  def welcome
    @user = params[:user]
    mail(
      to: @user.email,
      subject: 'Welcome to Futurapp'
    )
  end
end
