# frozen_string_literal: true

require 'google/cloud/firestore'

class FirestoreRecord
  def self.firestore
    @firestore ||= Google::Cloud::Firestore.new(
      project_id: 'avancevl-challenge',
      credentials: Rails.root.join('firebase-adminsdk-secret.json')
    )
  end
end
