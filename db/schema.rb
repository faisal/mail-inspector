# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "addresses", :primary_key => "ROWID", :force => true do |t|
    t.string "address"
    t.string "comment"
  end

  create_table "attachments", :primary_key => "ROWID", :force => true do |t|
    t.integer "message_id"
    t.string "name"
    t.integer "type"
  end

  create_table "duplicates_unread_count", :primary_key => "ROWID", :force => true do |t|
    t.string "message_id"
    t.integer "mailbox_id"
    t.integer "unread_count", :default => 0
  end
  
  create_table "events", :primary_key => "ROWID", :force => true do |t|
    t.integer "message_id"
    t.integer "start_date"
    t.integer "end_date"
    t.string "location"
    t.integer "out_of_date"
    t.integer "processed"
    t.integer "is_all_day"
    t.string "associated_id_string"
    t.string "original_receiving_account"
    t.string "ical_uid"
    t.integer "is_response_requested"
  end

  create_table "ews_folders", :primary_key => "ROWID", :force => true do |t|
    t.string "folder_id", :uniq => true
    t.integer "mailbox_id", :uniq => true
    t.string "sync_stage"
  end

  create_table "feeds", :primary_key => "ROWID", :force => true do |t|
    t.string "feed_url", :uniq => true
    t.integer "mailbox_id"
  do

  create_table "mailboxes", :primary_key => "ROWID", :force => true do |t|
    t.string "url", :uniq => true
    t.integer "total_count", :default => 0
    t.integer "unread_count", :default => 0
    t.integer "unseen_count", :default => 0
    t.integer "deleted_count", :default => 0
    t.integer "unread_count_adjusted_for_duplicates", :default => 0
    t.integer "change_identifier"
  end

  create_table "messages", :primary_key => "ROWID", :force => true do |t|
    t.string "message_id"
    t.binary "document_id"
    t.string "in_reply_to"
    t.integer "remote_id"
    t.integer "sender"
    t.string "subject_prefix"
    t.integer "subject"
    t.integer "date_sent"
    t.integer "date_received"
    t.integer "date_created"
    t.integer "date_last_viewed"
    t.integer "mailbox"
    t.integer "remote_mailbox"
    t.integer "original_mailbox"
    t.integer "flags"
    t.string "read"
    t.string "flagged"
    t.integer "size"
    t.string "color"
    t.string "encoding"
    t.integer "type"
    t.string "pad"
    t.integer "conversation_id", :default => -1
    t.text "snippet", :default => nil
    t.integer "fuzzy_ancestor", :default => nil
    t.integer "automated_conversation", :default => 0
    t.integer "root_status", :default => -1
  end

  create_table "properties", :primary_key => "ROWID", :force => true do |t|
    t.string "key", :uniq => true
    t.string "value"
  end

  create_table "recipients", :primary_key => "ROWID", :force => true do |t|
    t.integer "message_id"
    t.string "type"
    t.integer "address_id"
    t.integer "position"
  end

  create_table "subjects", :primary_key => "ROWID", :force => true do |t|
    t.string "subject"
    t.string "normalized_subject"
  end

  create_table "threads", :primary_key => "ROWID", :force => true do |t|
    t.integer "message_id"
    t.string "reference"
    t.string "is_originator"
  end
end
