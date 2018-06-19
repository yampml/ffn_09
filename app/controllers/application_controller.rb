class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def load_user
    @user = User.find_by id: params[:id]
    return unless @user.nil?
    flash[:danger] = t "flash_user_not_found"
    redirect_to root_path
  end
end
