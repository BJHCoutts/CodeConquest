class TranscriptsController < ApplicationController
  before_action :authenticate_user!

  def create
    drill = Drill.find(params[:drill_id])
    questions = drill.questions.order(:id)
    full_mark = questions.sum(:point)
    
    student_score = 0

    transcript = Transcript.create(user: current_user, drill: drill)
    
    questions.each_with_index do |q, index|
      is_correct = false
      student_answer = params[index.to_s]
      if q.answer == student_answer
        is_correct = true
        student_score += q.point
      end
      Record.create(user: current_user, transcript: transcript, drill: drill, question: q, student_answer: student_answer, is_correct: is_correct)
    end
    
    transcript.student_score = student_score
    transcript.full_mark = full_mark

    if transcript.save
      redirect_to transcript_path(transcript)
    else
      redirect_to drill_questions_path(drill)
    end
  end

  def show
    @transcript = Transcript.find(params[:id])
    @drill = @transcript.drill
    @records = @transcript.records.order(:id)
    @student_score = @transcript.student_score
    @total_score = @transcript.full_mark
    @percentage_score = '%.2f' % ((@student_score / Float(@total_score)) * 100)
    # byebug
  end
end
