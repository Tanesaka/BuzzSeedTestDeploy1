class Public::UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @answers = @user.answers.page(params[:page]).reverse_order

    # ユーザーが持つ全投稿のいいね合計
    @favorites_count = 0
    @answers.each do |answer|
      @favorites_count += answer.favorites.count
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :unique_code)
  end
end
