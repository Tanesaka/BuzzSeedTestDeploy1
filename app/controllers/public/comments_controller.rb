class Public::CommentsController < ApplicationController
  def create
    answer = Answer.find(params[:answer_id])
    comment = current_user.comments.new(comment_params)
    comment.answer_id = answer.id
    comment.save
    redirect_to answer_path(answer)
  end

  def destroy
    Comment.find_by(id: params[:id], answer_id: params[:answer_id]).destroy
    redirect_to answer_path(params[:answer_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
