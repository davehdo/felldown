class Event < ActiveRecord::Base
  after_create :notify
  
  require 'twilio-ruby'
  
  def notify
    # put your own credentials here
    raise "please define TWILIO_SID in config/application.yml" if ENV["TWILIO_SID"].nil?
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    Follower.all.select{|e|e.valid_number?}.each do |follower|
          @client.messages.create(
            :from => '+12673231623',
            :to => follower.number,
            :body => self.name
          )
        end
        
    Follower.all.select{|e| e.valid_email?}.each do |follower|
      FollowerMailer.send_notification(follower, self.name).deliver
    end
    
  end
  
  def icon
    if self.name =~ /fall/i
      "exclamation-triangle"
    elsif self.name =~ /confirms/i
      "comment"
    else
      "check"
    end
  end
  
  def created_on 
    self.created_at.to_date
  end
end
