class DrillsController < ApplicationController
    before_action :authenticate_user!

    def new
        @drill = Drill.new
    end

    def create
        @drill = Drill.new drill_params

        if @drill.save 
            drill_params[:answers].each do |answer|
                @drill.answers.create(answer)
            end
            redirect_to drills_path(@drill)
        else
            render :new
        end
    end

    def show
        @drill = Drill.find params[:id]
    end

    def edit
        @drill = Drill.find params[:id]
    end

    def destroy
        @drill = Drill.find(params[:id])
        @drill.destroy
    
        redirect_to drills_path
      end


    private
    def drill_params
        params.require(:drill).permit(:title, :description, :questions, :answers)
    end
end
