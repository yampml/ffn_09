class Match < ApplicationRecord
  has_many :bets
  has_many :comments, as: :commentable
  belongs_to :league, optional: true
  belongs_to :team1_matches, class_name: Team.name, foreign_key: :team1_id
  belongs_to :team2_matches, class_name: Team.name, foreign_key: :team2_id

  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validates :day, presence: true
  validates :start_time, presence: true

  scope :latest, ->{order day: :desc}

  delegate :name, :logo, to: :team1_matches, prefix: true, allow_nil: true
  delegate :name, :logo, to: :team2_matches, prefix: true, allow_nil: true
  delegate :name, to: :league, prefix: true, allow_nil: true
end
