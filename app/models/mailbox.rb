class Mailbox < ApplicationRecord
  has_many :messages, foreign_key: "mailbox", inverse_of: :mailbox
end
