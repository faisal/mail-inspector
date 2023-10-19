class Address < ApplicationRecord
  has_many :messages, :foreign_key => "sender"
end
