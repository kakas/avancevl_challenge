require "google/cloud/firestore"
require "csv"

def import_questions
  firestore = Google::Cloud::Firestore.new(
    project_id: 'avancevl-challenge',
    credentials: Rails.root.join('firebase-adminsdk-secret.json'),
  )

  csv = CSV.read(Rails.root.join('db/seeds/questions.csv'), headers: true)

  csv.each_slice(500) do |rows|
    rows.each do |row|
      # https://googleapis.dev/ruby/google-cloud-firestore/latest/index.html#batched-writes
      firestore.batch do |b|
        question_id = row['question_id']
        b.set("questions/#{question_id}", row.to_h)
      end
    end
  end
end

import_questions
