class PlayersController < ApplicationController
  before_action :load_all_teams, only: %i(new create)

  def index
    @players = Player.alphabet.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new player_params
    if @player.save
      flash[:success] = t ".flash_created_player"
      redirect_to players_path
    else
      flash[:danger] = t ".flash_create_failed"
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit :name, :dob, :position, :p_number, :picture, :team_id
  end

  def load_all_teams
    @team_list = Team.alphabet.map{|t| [t.name, t.id]}
  end
end
