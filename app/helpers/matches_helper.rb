module MatchesHelper
  def convert_time match_time
    I18n.localize match_time, format: :hour_minute
  end

  def has_score? score1, score2
    score1 && score2
  end
end
