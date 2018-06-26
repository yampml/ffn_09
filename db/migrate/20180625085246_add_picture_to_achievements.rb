class AddPictureToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :picture, :string
  end
end
