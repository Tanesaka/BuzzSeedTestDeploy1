class Admins::AnswersController < ApplicationController
  def index
    @answers = Answer.page(params[:page]).reverse_order
  end

  def show
    @answer = Answer.find(params[:id])
    @theme = @answer.theme
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to admins_answers_path
  end
end
