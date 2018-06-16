class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :team_id
      t.integer :number_of_matches, default: 0
      t.integer :win, default: 0
      t.integer :draw, default: 0
      t.integer :lose, default: 0
      t.integer :number_of_goals, default: 0
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
