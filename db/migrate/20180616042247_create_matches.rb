class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :team1_id, null: false
      t.integer :team2_id, null: false
      t.integer :score1
      t.integer :score2
      t.date :day, null: false
      t.time :start_time, null: false
      t.string :stadium
      t.string :city

      t.timestamps
    end
  end
end
