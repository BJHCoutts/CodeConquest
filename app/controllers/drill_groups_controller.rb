class DrillGroupsController < ApplicationController
  before_action :authenticate_user
  before_action :find_drill_group, only: [:show, :destroy, :edit]

  def new
    @drill_group = DrillGroup.new
  end

  def create
    @drill_group = DrillGroup.new(drill_group_params)
    @drill_group.user = current_user
    if @dirll_group.save
      redirect_to drill_group_path(@drill_group)
    else
      render :new
    end
  end

  def show
  
  end

  def index
    
  end

  def destroy
  
  end

  def edit
  
  end

  private
  def find_drill_group
    @drill_group = DrillGroup.find(params[:id])
  end

  def drill_group_params
    params.require(:drill_group).permit(:title, :description, :difficulty)
  end

  def authorize_user!
    unless can?(:mange, @drill_group)
      flash[:alert] = "Access Denied"
      # redirect_to 
    end
  end
end
