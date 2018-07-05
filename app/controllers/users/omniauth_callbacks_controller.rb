# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :login_process, only: %i(google_oauth2 facebook)

    def google_oauth2; end

    def facebook; end

    def passthru
      super
    end

    def failure
      redirect_to root_path
    end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end

    private

    def login_process
      @user = User.from_omniauth request.env["omniauth.auth"]
      if @user.persisted?
        sign_in_and_redirect @user
        flash[:sucess] = t ".successfully_logged_in"
      else
        session["devise.data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_path
      end
    end
  end
end
