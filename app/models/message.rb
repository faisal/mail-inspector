class Message < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :mailbox, foreign_key: "mailbox", inverse_of: :message
  belongs_to :sender, class_name: "Address", foreign_key: "sender", inverse_of: :messages
end
