class LeaguesController < ApplicationController
  def show
    @league = League.find_by id: params[:id]
    return if @league
    flash[:danger] = t ".not_found_league"
    redirect_to root_path
  end

  def new
    @league = League.new
    @team_list = Team.all.map{|t| [t.name, t.id]}
  end

  def create
    @league = League.new league_params
    load_team_to_league
    if @league.save
      flash[:success] = t ".league_create_success"
      redirect_to @league
    else
      render :new
    end
  end

  private

  def load_team_to_league
    Team.load_team_from_ids(params[:teams]).each do |team|
      @league.teams << team
    end
  end

  def league_params
    params.require(:league).permit :name
  end
end
