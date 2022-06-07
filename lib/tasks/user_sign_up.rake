namespace :user_sign_up do
  desc "Send a welcome email to new users"
  task welcome_mail: :environment do
    users = User.create
    users.each do |user|
      UserMailer.with(user: user).welcome.deliver_now
    end
  end

end
