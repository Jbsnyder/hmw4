class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params["user"])
    plain_text_password = params["user"]["password"]
    @user.password = BCrypt::Password.create(plain_text_password)
    @user.save
    redirect_to "/places"
  end
end
