# frozen_string_literal: true

module CurrentUser
  class AnswersController < ApplicationController
    before_action :user_auth
    before_action :set_question, only: :create

    def index
      respond_to do |format|
        format.html do
          answer_logs = current_user.answer_logs

          @total = answer_logs.size
          @total_correct = answer_logs.select { |log| log[:correct] }.size
          @accuracy = @total_correct * 100 / @total
        end
      end
    end

    def create
      respond_to do |format|
        format.json do
          result = current_user.answer(@question, params[:answer])
          render json: { result: result }
        end
      end
    end

    private

    def set_question
      @question = Question.find_by(question_id: params[:question_id])
      raise 'record not found' if @question.nil?
    end
  end
end
