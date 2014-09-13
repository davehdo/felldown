class FollowerMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def send_notification(user)
      @user = user
      x = mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app', from: 'ifelldown@help.me' )
    end
    
end
