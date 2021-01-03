class DropThmeme < ActiveRecord::Migration[5.2]
  def change
    drop_table :thmemes
  end
end
