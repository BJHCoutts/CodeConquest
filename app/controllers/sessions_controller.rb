class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
<<<<<<< HEAD
=======

>>>>>>> 77201b06dbb4c55892555ed7e64ed2b482797410
      redirect_to root_path, notice: "Logged in"
    else
      flash[:alert] = "Wrong email or password"
      render :new
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Successfully signed out"
  end
end
