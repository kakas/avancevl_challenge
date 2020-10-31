# frozen_string_literal: true

class PagesController < ApplicationController
  def home
  end

  def mail
    @name = current_user&.name || 'guest'
  end
end
