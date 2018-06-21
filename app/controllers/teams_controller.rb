class TeamsController < ApplicationController
  before_action :load_team, except: %i(new create)
  before_action :admin_user, except: :show

  def show; end

  def edit; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      flash[:success] = t ".flash_created_team"
      redirect_to @team
    else
      flash[:danger] = t ".flash_create_failed"
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit :name, :stadium, :picture, :city, :coach,
      :president, :description
  end

  def load_team
    @team = Team.find_by id: params[:id]
    return if @team
    flash[:danger] = t ".flash_team_not_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
