class SessionsController < ApplicationController
  def new; end

  def create
    if params[:normal_login].present?
      login_normal
    else
      login_google_oauth2
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

  private

  def login_normal
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      flash.now[:danger] = t ".invalid_login_message"
      render :new
    end
  end

  def login_google_oauth2
    auth = request.env["omniauth.auth"]
    a_email = auth.info[:email]
    @user = User.find_by email: a_email.downcase
    if @user.present?
      log_in @user
      redirect_to @user
    else
      redirect_to controller: :users, action: :new, name: auth.info.name,
        email: auth.info.email
    end
  end
end
