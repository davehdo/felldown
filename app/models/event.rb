class Event < ActiveRecord::Base
  after_create :notify_followers
  
  require 'twilio-ruby'
  
  def title
    "#{self.created_at.strftime("%H:%M")} #{self.name}"
  end
  
  def notify_followers
    # put your own credentials here
    raise "please define TWILIO_SID in config/application.yml" if ENV["TWILIO_SID"].nil?
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    if self.notify
      Follower.all.select{|e|e.valid_number?}.each do |follower|
        begin
          @client.messages.create(
            :from => '+12673231623',
            :to => follower.number,
            :body => self.name
          )
        rescue
          puts "Unable to send to #{follower.number}. invalid number?"
        end
      end
      email_addresses = Follower.all.select{|e| e.valid_email?}.collect{|e| e.email }
      if email_addresses and email_addresses.size > 0
        FollowerMailer.send_notification(email_addresses, self.name).deliver
      end
    end
  end
  
  def icon
    if self.color == "danger"
      "exclamation-triangle"
    elsif self.color == "warning"
      "medkit"
    else
      "comment"
    end
  end
  
  def created_on 
    self.created_at.to_date
  end
end
