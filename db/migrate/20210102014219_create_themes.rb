class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
