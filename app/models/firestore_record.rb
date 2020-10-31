# frozen_string_literal: true

require 'google/cloud/firestore'

module FirestoreRecord
  def firestore
    @firestore ||= Google::Cloud::Firestore.new(
      project_id: 'avancevl-challenge',
      credentials: Rails.root.join('firebase-adminsdk-secret.json')
    )
  end
end
