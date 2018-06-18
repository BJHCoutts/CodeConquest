class TranscriptsController < ApplicationController

  def create
    drill = Drill.find(params[:drill_id])
    questions = drill.questions 
    total_score = 0
    
    questions.each_with_index do |q, index|
    
      if q.answer == params["#{index}"]
        total_score += q.point
      else
        
      end
      is_correct = (q.answer == params["#{index}"])

      Record.create(user: current_user, question: q, is_correct: is_correct)
      
    end
    total_score = questions.sum(:point)
    
    transcript = Transcript.create(user: current_user, drill: drill, score: full_points)
    
    
    if transcript.save
      redirect_to transcript_path(transcript)
    else
      redirect_to drill_questions_path(drill)
    end
  end

  def show
    @transcript = Transcript.find(params[:id])
    @drill = @transcript.drill
    @questions = @drill.questions
    @correct_questions = @transcript.correct_questions
    @wrong_questions = @transcript.wrong_questions
  end

  private
  def transcript_params
    require(:transcript).permit(:score)
  end

end
