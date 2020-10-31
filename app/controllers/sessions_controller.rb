# frozen_string_literal: true

class SessionsController < ApplicationController
  # https://github.com/omniauth/omniauth#integrating-omniauth-into-your-application
  def google_oauth2_callback
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.uid
    redirect_to root_url
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
