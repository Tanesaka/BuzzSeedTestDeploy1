class Admins::ThemesController < ApplicationController
  def index
    @themes = Theme.page(params[:page]).reverse_order
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to admins_themes_path
  end
end
