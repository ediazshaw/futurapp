class UserMailer < ApplicationMailer
  def entry_notification
    @entry = params[:entry]
    mail(
      to:       @entry.user.email,
      subject:  "You have a memory to visit"
    )

  end
end
