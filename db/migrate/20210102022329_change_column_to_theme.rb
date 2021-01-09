class ChangeColumnToTheme < ActiveRecord::Migration[5.2]
  def change
    rename_column :themes, :image, :image_id
  end
end
