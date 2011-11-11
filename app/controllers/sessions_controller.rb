class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Logged In"
      redirect_to root_url
    else
      flash[:warning] = "Something is wrong"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to root_url
  end

end
