class Address < ApplicationRecord
  has_many :messages, foreign_key: "sender", inverse_of: :sender

  delegate :count, to: :messages, prefix: true
end
