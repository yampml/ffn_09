class AddBetTeamToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :team, :integer
  end
end
