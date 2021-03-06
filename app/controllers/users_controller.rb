class UsersController < ApplicationController
  before_action :authorize_user!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    authorize! :update, @user, :message => "Denied"  
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
      flash[:alert] = "Wait for account approval"
      redirect_to root_path
    else
      render :new
    end
  end

  def leaderboard
    # @leaders = User.order('score': :desc).limit(30).where('score IS NOT NULL')
    #we might change this controller later and add more features
    
    @transcripts = Transcript.select("user_id, count(*) as count_id").group("user_id").order("count_id desc").limit(10)
    
    
  end

  def update_score
    user.score = @correct_questions
  end

  def index
    if params[:is_approved] == "false"
      @users = User.where(is_approved: false)
    else
      @users = User.all.order(id: :desc)
    end
  end

  def update_approved
    @user = User.find(params[:id])
    @user.is_approved = !@user.is_approved
    @user.save
    redirect_to admin_dashboard_index_path
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
