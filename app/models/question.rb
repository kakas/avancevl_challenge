# frozen_string_literal: true

class Question < FirestoreRecord
  # collection
  def self.col
    @col ||= firestore.col('questions')
  end

  def self.find_by(question_id:)
    doc = col.doc(question_id)
    question = doc.get

    question.data
  end
end
