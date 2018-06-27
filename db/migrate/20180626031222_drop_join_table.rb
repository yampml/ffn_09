class DropJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :leagues, :teams do |t|
      # t.index [:league_id, :team_id]
      # t.index [:team_id, :league_id]
    end
  end
end
