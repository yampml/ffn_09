class AdmincpController < ApplicationController
  before_action :admin_user, only: :show

  def show; end
end
