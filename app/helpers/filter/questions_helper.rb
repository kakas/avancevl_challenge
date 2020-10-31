# frozen_string_literal: true

module Filter
  module QuestionsHelper
    def question_type_to_options
      {
        topics_algebra: %w[All Algebra],
        topics_geometry: %w[All Geometry],
        topics_trignometry: %w[All Trignometry],
        topics_arithmetic: %w[All Arithmetic],
        calculator: ['All', 'No Calculator', 'Calculator'],
        answer_type: ['All', 'Grid-In', 'Multiple Choice'],
        chart: ['All', 'No Chart', 'Chart'],
        length: %w[All Short Long],
      }
    end
  end
end
