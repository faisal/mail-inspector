class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end
end
