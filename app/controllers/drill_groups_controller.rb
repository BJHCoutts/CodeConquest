class DrillGroupsController < ApplicationController
  def new
    
  end

  def create
  
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
  def drill_group_params
    params.require(:drill_group).permit(:title, :description, :difficulty)
  end
end
