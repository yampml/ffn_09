class League < ApplicationRecord
  has_many :league_team_join_model
  has_many :teams, through: :league_team_join_model
  has_many :matches
  has_one :ranking

  validates :name, presence: true
end
