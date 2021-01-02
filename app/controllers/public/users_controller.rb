class Public::UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @answers = @user.answers
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :unique_code)
  end
end
