class Event < ActiveRecord::Base
  def icon
    if self.name =~ /fall/i
      "exclamation-triangle"
    elsif self.name =~ /confirms/i
      "comment"
    else
      "check"
    end
  end
end
