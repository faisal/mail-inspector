class Address < ApplicationRecord
  has_many :messages, foreign_key: "sender", inverse_of: :address
end
