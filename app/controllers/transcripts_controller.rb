class TranscriptsController < ApplicationController

  def create
    byebug
    @drill = Drill.find(params[:drill_id])
    @questions = @drill.questions 
    total_score = 0
    @questions.each_with_index do |q, index|
      if q.answer == params["#{index}"]
        total_score += q.point
      end
    end
    
    
    # vote = Vote.new(user: current_user, answer: answer, up: params[:up])
    @transscript = Transcript.create(transcript_params)
  end

  private
  def transcript_params
    require(:transcript).permit(:score)
  end

end
