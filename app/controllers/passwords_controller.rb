class PasswordsController < ApplicationController
    before_action :authenticate_user!, :find_user, :authorize_user!
  
    def edit
    end
  
    def update
      if @user.authenticate(params[:password][:current_password])
        @user.update(
          password: params[:password][:new_password],
          password_confirmation: params[:password][:new_password_confirmation]
        )
  
        if @user.valid?
          flash[:success] = "Password changed"
          redirect_to edit_user_path(@user)
        else
          flash[:alert] = @user.errors.full_messages.join(", ")
          redirect_to edit_user_password_path(@user)
        end
      else
        flash[:alert] = "Did you forget your password?"
        redirect_to edit_user_password_path(@user)
      end
    end
  
    private
  
    def find_user
      @user = User.find params[:user_id] if params[:user_id].present?
    end
  
    def authorize_user!
      unless can?(:manage, @user)
        flash[:alert] = "You are not allowed to edit user's password"
        redirect_to root_path
      end
    end
  end
  