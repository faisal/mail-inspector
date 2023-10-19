class Mailbox < ApplicationRecord
  has_many :messages, :foreign_key => "mailbox"
end
