class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @activationKey = User.generate_password    
    @user.update_attributes(:active_state => 0, :activation_key => @activationKey)
    
    if @user.save
      UserMailer.activation_email(@user).deliver
      flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def update_account
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(session[:user_id])
    
    if @user.update_attributes(params[:user])
      flash[:success] = "Account Details Updated"
      redirect_to root_url
    else
      render "edit"
    end
  end
  
  def forgot_password
    @user = User.find_by_email(params[:email])
    
    if @user
      @newPass = User.generate_password
      if @user.update_attributes(:password => @newPass)
        UserMailer.update_password(@user, @newPass).deliver
        flash[:success] = "Password Updated"
        redirect_to root_url
      else
        flash[:error] = "Problem Updating Password"
      end
    end
  end
  
  def activate
    @user = User.find_by_activation_key(params[:key])
    
    if @user.update_attributes(:activation_key => "active", :active_state => "1")
      UserMailer.welcome_email(@user).deliver
      flash[:success] = "Your Account was activated"
      redirect_to log_in_url
    else
      flash[:error] = "There was a problem with your activation key"
      redirect_to root_url
    end
  end

end
