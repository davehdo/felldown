class Follower < ActiveRecord::Base
  def valid_number?
    self.number.match(/\+\d{11}/) != nil
  end
end
