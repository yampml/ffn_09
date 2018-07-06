class UsersController < ApplicationController
  before_action :load_user, only: :show
  before_action :admin_user, only: :destroy
  load_and_authorize_resource

  def index
    @users = User.all.paginate page: params[:page], per_page: Settings.per_page
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:success] = t "flash_deleted_user"
    else
      flash[:danger] = t "flash_cannot_delete"
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :password,
      :password_confirmation
  end

  def correct_user
    redirect_to root_path unless current_user? @user
  end
end
