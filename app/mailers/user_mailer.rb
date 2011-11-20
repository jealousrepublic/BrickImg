class UserMailer < ActionMailer::Base
  default :from => "bbartholomew@aardvarkbrigade.com"
  
  def welcome_email(user)
    @username = user.username
    mail(:to => user.email, :subject => "Welcome to BrickImg")
  end
  
  def update_password(user, newPass)
    @newPass = newPass
    mail(:to => user.email, :subject => "Password Reset")
  end
  
  def activation_email(user)
    @activationKey = user.activation_key
    mail(:to => user.email, :subject => "Activate Your Account")
  end
  
end
