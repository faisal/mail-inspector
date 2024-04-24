class Mailbox < ApplicationRecord
  has_many :messages, foreign_key: "mailbox", inverse_of: :mailbox

  delegate :count, to: :messages, prefix: true
end
