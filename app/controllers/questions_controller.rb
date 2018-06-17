class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
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
    params.require(:question).permit(:body, :answer, :options, :point)
  end
end
