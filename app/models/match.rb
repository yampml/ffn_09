class Match < ApplicationRecord
  has_many :bets
  has_many :comments, as: :commentable
  belongs_to :league
  belongs_to :team1_matches, class_name: Team.name, foreign_key: :team1_id
  belongs_to :team2_matches, class_name: Team.name, foreign_key: :team2_id

  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validates :day, presence: true
  validates :start_time, presence: true
  validates :score1, numericality: {
    only_integer: true,
    greater_than_or_equal_to: Settings.min_score
  }, presence: true
  validates :score2, numericality: {
    only_integer: true,
    greater_than_or_equal_to: Settings.min_score
  }, presence: true
end
