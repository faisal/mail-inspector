class Message < ApplicationRecord
  self.inheritance_column = :_type_disabled

  belongs_to :mailbox, :foreign_key => "mailbox"
  belongs_to :sender, :class_name => "Address", :foreign_key => "sender"
end
