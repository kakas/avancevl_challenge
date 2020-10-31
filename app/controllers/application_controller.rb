# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(uid: session[:user_id])
  end
  helper_method :current_user

  def user_auth
    return if current_user

    redirect_to root_url, alert: 'Please log in'
  end
end
