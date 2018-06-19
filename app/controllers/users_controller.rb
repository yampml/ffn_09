class UsersController < ApplicationController
  before_action :load_user, except: %i(new create)
  before_action :logged_in_user, :correct_user, only: %i(edit update)

  def show; end

  def new
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "flash_welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash_updated_profile"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "flash_pls_log_in"
    redirect_to login_path
  end

  def correct_user
    redirect_to root_path unless current_user? @user
  end
end
