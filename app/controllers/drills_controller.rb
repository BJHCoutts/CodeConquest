class DrillsController < ApplicationController
    def new
        @drill = Drill.new
    end

    def create
        @drill = Drill.new drill_params
        if @drill.save 
            render text: "Drill created successfully"
        else
            render :new
        end
    end


    private
    def drill_params
        params.require(:drill).permit(:title, :description, :questions, :answers)
    end
end
