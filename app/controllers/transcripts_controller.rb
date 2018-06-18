class TranscriptsController < ApplicationController

  def create
    drill = Drill.find(params[:drill_id])
    questions = drill.questions 
    total_score = 0
    
    questions.each_with_index do |q, index|
    
      record 
      if taken == 0
        record = Record.create(user: current_user, question: q, student_answer: index)
      else
        record = Record.where(user_id: current_user, question_id: q)
      

      if q.answer == params["#{index}"]
        record.correct_time += 1
        total_score += q.point
      else
        record.incorrect_time += 1
      end
      
    end
    transcript = Transcript.create(user: current_user, drill: drill, score: total_score)
    
    
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
