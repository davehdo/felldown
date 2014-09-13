class FollowerMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_notification(user, message)
      @user = user
      @message = message #you can adjust the body of the message in the views/follower_mailer/send_notification.erb
      x = mail( :to => @user.email,
      :subject => message, from: 'ifelldown@help.me' )
    end
    
end
