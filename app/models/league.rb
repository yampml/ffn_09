class League < ApplicationRecord
  has_many :teams, through: :leagues_teams
  has_many :matches
  has_one :ranking

  validates :name, presence: true
end
