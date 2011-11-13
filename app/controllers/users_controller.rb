class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed Up!"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def forgot_password
    @user = User.find_by_email(params[:email])
    if @user
      @newPass = User.generate_password
      @user.update_attributes(:password => @newPass)
      if @user.save
        UserMailer.update_password(@user, @newPass).deliver
        flash[:success] = "Password Updated"
        redirect_to root_url
      else
        flash[:error] = "Problem Updating Password"
      end
    end
  end

end
