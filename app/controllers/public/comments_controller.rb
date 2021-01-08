class Public::CommentsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    comment = current_user.comments.new(comment_params)

    # 下記試したが変わらず1/8
    # comment = Comment.new(comment_params)
    # comment.user_id = current_user.id
    comment.answer_id = @answer.id
    unless comment.save
      redirect_to answers_path, alert: 'コメントを反映できませんでした。※1文字以上入力してください。'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], answer_id: params[:answer_id]).destroy
    # destroy.js.erbに渡す変数
    @answer = Answer.find(params[:answer_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :answer_id, :user_id)
  end
end
