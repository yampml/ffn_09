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
  scope :closest, ->{order day: :asc}
  scope :owned_by, ->(league_id){where "league_id = ?", league_id}
  scope :by_status, (lambda do |status|
    if status == Settings.done_value
      where "day <= ? AND score1 IS NOT NULL AND score2 IS NOT NULL", Time.zone.today
    elsif status == Settings.undone_value
      where "day >= ? AND score1 IS NULL AND score2 IS NULL", Time.zone.today
    else
      all
    end
  end)

  delegate :name, :logo, to: :team1_matches, prefix: true, allow_nil: true
  delegate :name, :logo, to: :team2_matches, prefix: true, allow_nil: true
  delegate :name, to: :league, prefix: true, allow_nil: true
end
