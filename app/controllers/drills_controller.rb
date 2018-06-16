class DrillsController < ApplicationController
    def new
        @drill = Drill.new
    end

    def create
        @drill = Drill.new drill_params

        if @drill.save 
            drill_params[:answers].each do |answer|
                @drill.answers.create(answer)
            end
            render text: "Skirmish created successfully"
        else
            render :new
        end
    end

    def edit
        @drill = Drill.find params[:id]
    end


    private
    def drill_params
        params.require(:drill).permit(:title, :description, :questions, :answers)
    end
end
