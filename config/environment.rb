# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Felldown::Application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => 'eugyev',
  :password => 'rolodoc1',
  :domain => 'ifelldownhelp.me',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}