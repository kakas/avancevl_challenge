# frozen_string_literal: true

class ProblemController < ApplicationController
  before_action :set_question, only: [:show]

  def show
  end

  private

  def set_question
    @question = Question.find_by(question_id: params[:id])
    @error_message = 'Question not found' if @question.nil?
  end
end
