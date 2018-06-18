class SessionsController < ApplicationController
  before_action :find_user, only: :create

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      flash.now[:danger] = t ".invalid_login_message"
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

  def find_user
    @user = User.find_by email: params[:session][:email].downcase
  end
end
