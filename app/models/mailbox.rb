class Mailbox < ActiveRecord::Base
  has_many :messages, :foreign_key => "mailbox"
end
