class Public::ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user_id = current_user.id
    @theme.save
    redirect_to themes_path
  end

  def show
    @theme = Theme.find(params[:id])
    @answer = Answer.new
    @answers = @theme.answers
  end

  def index
    @themes = Theme.all
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to themes_path
  end

  private

  def theme_params
    params.require(:theme).permit(:image)
  end
end
