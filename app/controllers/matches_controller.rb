class MatchesController < ApplicationController
  before_action :load_all_filter, only: :index
  before_action :admin_user, :load_match, except: :index
  before_action :load_all_matches, :load_searched_result, only: :index

  def index
    @matches = @matches.latest.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    if @match.destroy
      flash[:success] = t ".flash_deleted_match"
    else
      flash[:danger] = t ".flash_delete_failed"
    end
    redirect_to matches_path
  end

  private

  def load_all_filter
    @league_list = League.alphabet.map{|t| [t.name, t.id]}
    @status = [Settings.done_pair_value.split(/\W+/), Settings.undone_pair_value.split(/\W+/)]
  end

  def load_all_matches
    @matches = Match.all
  end

  def load_searched_result
    @matches = @matches.owned_by(params[:league_id]) if params[:league_id].present?
    @matches = @matches.by_status(params[:status]) if params[:status].present?
  end

  def load_match
    @match = Match.find_by id: params[:id]
    return if @match
    flash[:danger] = t "flash_match_not_found"
    redirect_to root_path
  end
end
