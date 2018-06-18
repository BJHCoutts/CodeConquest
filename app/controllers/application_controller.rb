class ApplicationController < ActionController::Base
rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_path
end
  private
  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :current_user
  
  def authenticate_user!
    unless user_signed_in?
      flash[:alert] =  "You must sign in or sign up first!"
      redirect_to new_session_path
    end
  end

  private

  def authorize_user!
    unless can?(:manage, current_user)
      flash[:alert] = "Access Denied"
      redirect_to root_path
    end
  end


end
