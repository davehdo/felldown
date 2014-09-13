class Follower < ActiveRecord::Base
  def valid_number?
    self.number.match(/\+\d{11}/) != nil
  end
  
  def valid_email?
    self.email.match(/[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i) != nil
  end
end
