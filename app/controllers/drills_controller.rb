class DrillsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill, only: [:show, :edit, :destroy]

  def new
    @drill = Drill.new
    @drill_group = DrillGroup.find(params[:drill_group_id])
  end

  def create
    @drill_group = DrillGroup.find(params[:drill_group_id])
    @drill = Drill.new drill_params
    @drill.drill_group = @drill_group

    if @drill.save 
      redirect_to drills_path(@drill)
    else
      render :new
    end
  end

  def show
    @questions = @drill.questions
  end

  def edit
  end

  def destroy
    @drill.destroy
    redirect_to drill_group_path(@drill.drill_group)
  end


  private
  def find_drill
    @drill = Drill.find params[:id]
  end

  def drill_params
      params.require(:drill).permit(:title, :description, :questions => [], :answers => [])
  end
end
