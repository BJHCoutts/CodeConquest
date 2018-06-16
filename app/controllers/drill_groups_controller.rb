class DrillGroupsController < ApplicationController
  before_action :find_drill_group

  def new
    @drill_group = DrillGroup.new
  end

  def create
    @drill_group = DrillGroup.new(params[:client])
    @dirll_group.save
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
end
