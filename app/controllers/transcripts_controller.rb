class TranscriptsController < ApplicationController

  def create
    drill = Drill.find(params[:drill_id])
    questions = drill.questions 
    total_score = 0
    correct_questions = []
    wrong_questions = []
    questions.each_with_index do |q, index|
      if q.answer == params["#{index}"]
        total_score += q.point.to_i
        correct_questions << index
      else
        wrong_questions << index
      end
    end
    transcript = Transcript.create(user: current_user, drill: drill, score: total_score, correct_questions: correct_questions, wrong_questions: wrong_questions )
    
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
