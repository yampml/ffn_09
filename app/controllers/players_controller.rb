class PlayersController < ApplicationController
  def index
    @players = Player.alphabet.paginate page: params[:page], per_page: Settings.per_page
  end

  private

  def player_params
    params.require(:player).permit :name, :dob, :position, :p_number
  end
end
