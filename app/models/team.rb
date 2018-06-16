class Team < ApplicationRecord
  has_many :players
  has_many :team1_matches, class_name: Match.name, foreign_key: :team1_id
  has_many :team2_matches, class_name: Match.name, foreign_key: :team2_id
  has_many :leagues, through: :leagues_teams
  belongs_to :country

  validates :name, presence: true
end
