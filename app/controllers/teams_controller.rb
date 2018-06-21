class TeamsController < ApplicationController
  before_action :load_team, except: %i(index new create)
  before_action :admin_user, except: %i(show index)

  def index
    @teams = Team.all.paginate page: params[:page], per_page: Settings.per_page
  end

  def show; end

  def edit; end

  def update
    if @team.update_attributes team_params
      flash[:success] = t ".flash_updated_team"
      redirect_to @team
    else
      flash[:danger] = t ".flash_update_failed"
      render :edit
    end
  end

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
      :president, :description, :logo
  end

  def load_team
    @team = Team.find_by id: params[:id]
    return if @team
    flash[:danger] = t ".flash_team_not_found"
    redirect_to root_path
  end

  def admin_user
    return if authorized_admin? current_user
    flash[:danger] = t "flash_warning_user"
    redirect_to root_path
  end
end
