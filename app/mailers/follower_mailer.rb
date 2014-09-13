class FollowerMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_notification(email_addresses, message)
      @message = message #you can adjust the body of the message in the views/follower_mailer/send_notification.erb
      x = mail( :to => email_addresses,
      :subject => message, from: 'ifelldown@help.me' )
    end
    
end
