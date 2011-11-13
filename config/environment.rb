# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BrickImg::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "s47403.gridserver.com",
  :port => "25",
  :domain => "jealousrepublic.com",
  :authentication => :plain,
  :user_name => "bri@jealousrepublic.com",
  :password => "#73yxboob"
}
