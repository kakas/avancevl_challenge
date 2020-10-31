# frozen_string_literal: true

class Question
  extend FirestoreRecord

  FIELDS = %i[
    question_id
    question_text
    answer
    question_title
    hashtags
    topics_algebra
    topics_geometry
    topics_trignometry
    topics_arithmetic
    calculator
    answer_type
    chart
    length
  ].freeze

  attr_accessor(*FIELDS)

  # collection
  def self.col
    @col ||= firestore.col('questions')
  end

  def self.find_by(question_id:)
    doc = col.doc(question_id)
    LazyObject.new do
      question = doc.get
      new(question.data)
    end
  end

  def initialize(attrs)
    FIELDS.each do |field|
      instance_variable_set("@#{field}", attrs[field])
    end
  end
end
