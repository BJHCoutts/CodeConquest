class QuestionsController < ApplicationController
  def new
    @drill = Drill.find(params[:drill_id])
    @question = Question.new
  end

  def create
    drill = Drill.find(params[:drill_id])
    question = Question.create(question_params)
    question.drill = drill
    if question.save
      redirect_to drill_path(drill)
    else
      render :new
    end
  end

  def edit

  end
  
  def destroy

  end

  private
  def question_params
    params.require(:question).permit(:body, :answer, :point, :options => [])
    # params.require(:question).permit(:question_details, :question_content, :user_id, :accepted_answer_id, :province_id, :city, :category_ids => [])
  end
end
