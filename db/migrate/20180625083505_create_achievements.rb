class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :name, null: false
      t.date :received_day, null: false

      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
