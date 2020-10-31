# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(uid: session[:user_id])
  end
  helper_method :current_user
end
