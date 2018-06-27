class MatchesController < ApplicationController
  def index
    @matches = Match.latest.limit(Settings.limit_number_of_matches)
      .paginate page: params[:page], per_page: Settings.per_page
  end
end
