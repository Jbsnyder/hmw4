class SessionsController < ApplicationController
  def new
  end

  def create
    submitted_email = params["email"]
    submitted_password = params["password"]

    @user = User.where({ email: submitted_email })[0]
    if @user
      if BCrypt::Password.new(@user.password) == submitted_password
        session[:user_id] = @user.id
        redirect_to "/places"
      else 
        flash[:notice] = "Password is incorrect"
        redirect_to "/sessions/new"
      end 
    else
      flash[:notice] = "No user with that email address"
      redirect_to "/sessions/new"
  end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to "/sessions/new"
  end
end
  