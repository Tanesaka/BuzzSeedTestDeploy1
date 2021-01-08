class Public::FavoritesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.new(answer_id: @answer.id)
    favorite.save
    # いいね非同期化のためリダイレクトしない
    # redirect_to request.referer
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    favorite = current_user.favorites.find_by(answer_id: @answer.id)
    favorite.destroy
    # redirect_to request.referer
  end

  # private
  # def favorite_params
  #   params.require(:favorite).permit(:user_id, :answer_id)
  # end
end
