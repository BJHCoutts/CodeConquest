class TranscriptsController < ApplicationController

  def create
    drill = Drill.find(params[:drill_id])
    questions = drill.questions 
    total_score = 0
    questions.each_with_index do |q, index|
      if q.answer == params["#{index}"]
        total_score += q.point.to_i
      end
    end
    transcript = Transcript.create(user: current_user, drill: drill, score: total_score)
    
    if transcript.save
      redirect_to root_path
    end
    
  end

  private
  def transcript_params
    require(:transcript).permit(:score)
  end

end
