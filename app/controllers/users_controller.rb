class UsersController < ApplicationController

  before_action :authorize_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update edit_user_params
      flash[:success] = "Changes saved"
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
    end
    redirect_to edit_user_path
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In!"
    else
      render :new
    end
  end

  def leaderboard
    @leaders = User.order('score': :desc).limit(30).where('score IS NOT NULL')
    #we might change this controller later and add more features
  end

  def update_score
    user.score = @correct_questions
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def edit_user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
