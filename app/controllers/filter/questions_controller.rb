# frozen_string_literal: true

module Filter
  class QuestionsController < ApplicationController
    def index
      respond_to do |format|
        format.html
        format.json do
          questions = Question.where(search_params)
          render json: { question_count: questions.size }
        end
      end
    end

    private

    def search_params
      @search_params = params.permit(Question::SEARCHABLE_FIELDS)
      @search_params.delete_if { |_k, v| v == 'All' }
    end
  end
end
