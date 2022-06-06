# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/recordatory
  def recordatory
    user = User.last
    UserMailer.recordatory(user)
  end

end
