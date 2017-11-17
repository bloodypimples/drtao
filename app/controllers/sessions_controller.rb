class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to admin_root_path, notice: "Signed in successfully."
    else
      flash[:alert] = "Incorrect email or password."
      render :new
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully."
  end
end
