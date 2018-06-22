class CreateLeagueTeamJoinModels < ActiveRecord::Migration[5.1]
  def change
    create_table :league_team_join_models do |t|
      t.bigint "league_id", null: false
      t.bigint "team_id", null: false
      t.index ["league_id"], name: "index_leagues_teams_on_league_id"
      t.index ["team_id"], name: "index_leagues_teams_on_team_id"
      t.timestamps
    end
  end
end
