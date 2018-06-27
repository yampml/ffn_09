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
  validate :check_team_different
  validate :check_schedule

  scope :latest, ->{order day: :desc}
  scope :closest, ->{order day: :asc}
  scope :owned_by, ->(league_id){where "league_id = ?", league_id}
  scope :matches_in_day, ->(day){where day: day}
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

  def check_team_different
    errors.add :team1_id, "2 team can't be the same" if team1_id == team2_id
  end

  def has_match?
    return false if team1_id.nil? || team2_id.nil?
    team_match_ids = Match.matches_in_day(day).pluck(:team1_id, :team2_id).flatten.to_set
    [team1_id, team2_id].any?{|i| team_match_ids.include?(i)}
  end

  def check_schedule
    errors.add :day, "Already match in the day selected" if has_match?
  end
end
