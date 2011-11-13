class UserMailer < ActionMailer::Base
  default :from => "bbartholomew@aardvarkbrigade.com"
  
  def update_password(user, newPass)
    @newPass = newPass
    mail(:to => user.email, :subject => "Updated Your Password.")
  end
  
end
