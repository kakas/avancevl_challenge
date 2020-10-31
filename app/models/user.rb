# frozen_string_literal: true

class User
  extend FirestoreRecord

  FIELDS = %i[uid name email].freeze

  attr_accessor(*FIELDS)

  # collection
  def self.col
    @col ||= firestore.col('users')
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    info = auth_hash['info']
    user = find_by(uid: auth_hash['uid'])
    if user.nil?
      create(uid: auth_hash['uid'], email: info['email'], name: info['name'])
    else
      user
    end
  end

  def self.create(attrs)
    result = col.doc(attrs[:uid]).set(attrs, merge: true)
    return new(attrs) if result.update_time

    false
  end

  def self.find_by(uid:)
    doc = col.doc(uid)

    LazyObject.new do
      user = doc.get
      new(user.data) if user.data
    end
  end

  def initialize(attrs)
    FIELDS.each do |field|
      instance_variable_set("@#{field}", attrs[field])
    end
  end
end
