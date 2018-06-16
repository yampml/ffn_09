class AddAllReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :news, :user, foreign_key: true
    add_reference :bets, :user, foreign_key: true
    add_reference :bets, :match, foreign_key: true
    add_reference :matches, :league, foreign_key: true
    add_reference :leagues, :country, foreign_key: true
    add_reference :teams, :country, foreign_key: true
    add_reference :players, :country, foreign_key: true
    add_reference :players, :team, foreign_key: true
    add_reference :transfers, :player, foreign_key: true
    add_reference :countries, :continent, foreign_key: true
    add_reference :rankings, :league, foreign_key: true
    add_reference :comments, :user, foreign_key: true
  end
end
