# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 0) do
  create_table "action_flags", primary_key: "ROWID", force: :cascade do |t|
    t.integer "action"
    t.integer "flag_type"
    t.integer "flag_value"
    t.index ["action"], name: "action_flags_action_index"
  end

  create_table "action_labels", primary_key: "ROWID", force: :cascade do |t|
    t.integer "action"
    t.integer "do_add"
    t.integer "label"
    t.index ["action"], name: "action_labels_action_index"
    t.index ["label"], name: "action_labels_label_index"
  end

  create_table "action_messages", primary_key: "ROWID", force: :cascade do |t|
    t.integer "action"
    t.integer "action_phase"
    t.integer "message"
    t.integer "remote_id"
    t.integer "destination_message"
    t.index ["action"], name: "action_messages_action_index"
    t.index ["destination_message"], name: "action_messages_destination_message_index"
    t.index ["message"], name: "action_messages_message_index"
  end

  create_table "additional_remote_content_links", primary_key: "ROWID", force: :cascade do |t|
    t.text "url", null: false
    t.integer "requests", default: 0, null: false
    t.integer "last_seen_date", null: false
    t.integer "last_request_date", default: 0, null: false
    t.index ["requests", "last_request_date"], name: "additional_remote_content_links_requests_last_request_date_index"
    t.index ["requests", "last_seen_date"], name: "additional_remote_content_links_requests_last_seen_date_index"
  end

  create_table "address_metadata", primary_key: "ROWID", force: :cascade do |t|
    t.text "address", null: false
    t.text "smime_capabilities", null: false
    t.integer "smime_capabilities_date", null: false
  end

  create_table "addresses", primary_key: "ROWID", force: :cascade do |t|
    t.text "address", null: false
    t.text "comment", null: false
  end

  create_table "attachments", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message", null: false
    t.text "attachment_id"
    t.text "name"
    t.index ["message", "attachment_id"], name: "attachments_message_attachment_id_index"
    t.index ["message", "name"], name: "attachments_message_name_index"
  end

  create_table "brand_indicators", primary_key: "ROWID", force: :cascade do |t|
    t.text "url", null: false
    t.text "evidence_url", null: false
    t.binary "indicator"
    t.text "indicator_hash"
    t.text "hash_algorithm"
    t.integer "verified", default: 0, null: false
    t.index ["indicator", "url", "indicator_hash", "hash_algorithm"], name: "brand_indicators_indicator_url_indicator_hash_hash_algorithm_index", where: "indicator IS NULL"
    t.index ["url", "verified"], name: "brand_indicators_url_verified_index"
  end

  create_table "conversation_id_message_id", primary_key: ["conversation_id", "message_id"], force: :cascade do |t|
    t.integer "conversation_id", null: false
    t.integer "message_id", default: 0, null: false
    t.integer "date_sent", default: 0, null: false
    t.index ["message_id", "conversation_id"], name: "conversation_id_message_id_message_id_conversation_id_index"
  end

  create_table "conversations", primary_key: "conversation_id", force: :cascade do |t|
    t.integer "flags", default: 0, null: false
    t.text "sync_key"
    t.index ["flags"], name: "conversations_flags_index"
  end

  create_table "data_detection_results", primary_key: "ROWID", force: :cascade do |t|
    t.integer "global_message_id", null: false
    t.text "category", null: false
    t.text "value", null: false
  end

  create_table "duplicates_unread_count", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "mailbox_id", null: false
    t.integer "unread_count", default: 0
    t.index ["mailbox_id"], name: "duplicates_unread_count_mailbox_id_index"
  end

  create_table "events", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "start_date"
    t.integer "end_date"
    t.text "location"
    t.integer "out_of_date", default: 0
    t.integer "processed", default: 0
    t.integer "is_all_day", default: 0
    t.text "associated_id_string"
    t.text "original_receiving_account"
    t.text "ical_uid"
    t.integer "is_response_requested", default: 0
    t.index ["message_id"], name: "events_message_id_index"
  end

  create_table "ews_folders", primary_key: "ROWID", force: :cascade do |t|
    t.text "folder_id"
    t.integer "mailbox_id", null: false
    t.text "sync_state"
    t.index ["mailbox_id"], name: "ews_folders_mailbox_id_index"
  end

  create_table "labels", primary_key: ["message_id", "mailbox_id"], force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "mailbox_id", null: false
    t.index ["mailbox_id"], name: "labels_mailbox_id_index"
  end

  create_table "last_spotlight_check_date", primary_key: "message_id", force: :cascade do |t|
    t.integer "date"
    t.index ["message_id", "date"], name: "last_spotlight_check_date_message_id_date_index"
  end

  create_table "local_message_actions", primary_key: "ROWID", force: :cascade do |t|
    t.integer "mailbox"
    t.integer "source_mailbox"
    t.integer "destination_mailbox"
    t.integer "action_type"
    t.integer "user_initiated"
    t.index ["mailbox", "ROWID"], name: "local_message_actions_mailbox_rowid_index"
  end

  create_table "mailbox_actions", primary_key: "ROWID", force: :cascade do |t|
    t.text "account_identifier"
    t.integer "action_type"
    t.text "mailbox_name"
    t.integer "mailbox"
    t.text "new_mailbox_name"
  end

  create_table "mailboxes", primary_key: "ROWID", force: :cascade do |t|
    t.text "url", null: false
    t.integer "total_count", default: 0, null: false
    t.integer "unread_count", default: 0, null: false
    t.integer "deleted_count", default: 0, null: false
    t.integer "unseen_count", default: 0, null: false
    t.integer "unread_count_adjusted_for_duplicates", default: 0, null: false
    t.text "change_identifier"
    t.integer "source"
    t.text "alleged_change_identifier"
    t.index ["source"], name: "mailboxes_source_index"
  end

  create_table "message_global_data", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message_id"
    t.integer "follow_up_start_date"
    t.integer "follow_up_end_date"
    t.text "follow_up_jsonstringformodelevaluationforsuggestions"
    t.integer "download_state", default: 0, null: false
    t.integer "read_later_date"
    t.integer "send_later_date"
    t.index ["follow_up_end_date"], name: "message_global_data_follow_up_end_date_index"
    t.index ["follow_up_jsonstringformodelevaluationforsuggestions"], name: "message_global_data_follow_up_jsonstringformodelevaluationforsuggestions_index"
    t.index ["follow_up_start_date"], name: "message_global_data_follow_up_start_date_index"
    t.index ["read_later_date"], name: "message_global_data_read_later_date_index"
    t.index ["send_later_date"], name: "message_global_data_send_later_date_index"
  end

  create_table "message_metadata", primary_key: "message_id", force: :cascade do |t|
    t.integer "timestamp", null: false
    t.text "json_values", null: false
    t.index ["timestamp"], name: "message_metadata_timestamp_index"
  end

  create_table "message_references", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message", null: false
    t.integer "reference", default: 0, null: false
    t.integer "is_originator", default: 0, null: false
    t.index ["message", "reference"], name: "message_references_message_reference_index"
    t.index ["reference", "message"], name: "message_references_reference_message_index"
  end

  create_table "message_rich_links", primary_key: ["global_message_id", "rich_link"], force: :cascade do |t|
    t.integer "global_message_id", null: false
    t.integer "rich_link", null: false
  end

  create_table "messages", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message_id", default: 0, null: false
    t.integer "global_message_id", null: false
    t.integer "remote_id"
    t.text "document_id"
    t.integer "sender"
    t.text "subject_prefix"
    t.integer "subject", null: false
    t.integer "summary"
    t.integer "date_sent"
    t.integer "date_received"
    t.integer "mailbox", null: false
    t.integer "remote_mailbox"
    t.integer "flags", default: 0, null: false
    t.integer "read", default: 0, null: false
    t.integer "flagged", default: 0, null: false
    t.integer "deleted", default: 0, null: false
    t.integer "size", default: 0, null: false
    t.integer "conversation_id", default: 0, null: false
    t.integer "date_last_viewed"
    t.integer "list_id_hash"
    t.integer "unsubscribe_type"
    t.integer "searchable_message"
    t.integer "brand_indicator"
    t.integer "display_date"
    t.text "color"
    t.integer "type"
    t.integer "fuzzy_ancestor"
    t.integer "automated_conversation", default: 0
    t.integer "root_status", default: -1
    t.index ["brand_indicator"], name: "messages_brand_indicator_index"
    t.index ["conversation_id", "mailbox", "deleted"], name: "messages_conversation_id_mailbox_deleted_index"
    t.index ["conversation_id", "mailbox", "flagged", "deleted"], name: "messages_conversation_id_mailbox_flagged_deleted_index"
    t.index ["conversation_id", "mailbox", "flags", "deleted"], name: "messages_conversation_id_mailbox_flags_deleted_index"
    t.index ["conversation_id", "mailbox", "read", "date_received", "deleted"], name: "messages_conversation_id_mailbox_read_date_received_deleted_index"
    t.index ["conversation_id", "mailbox", "sender", "date_received", "deleted"], name: "messages_conversation_id_mailbox_sender_date_received_deleted_index"
    t.index ["conversation_id"], name: "messages_conversation_id_index"
    t.index ["date_last_viewed"], name: "messages_date_last_viewed_index"
    t.index ["date_received"], name: "messages_date_received_index"
    t.index ["deleted", "date_received"], name: "messages_deleted_date_received_index"
    t.index ["deleted", "mailbox"], name: "messages_deleted_mailbox_index"
    t.index ["deleted"], name: "messages_deleted_index"
    t.index ["document_id"], name: "messages_document_id_index"
    t.index ["flagged"], name: "messages_flagged_index"
    t.index ["fuzzy_ancestor"], name: "messages_fuzzy_ancestor_index"
    t.index ["global_message_id", "mailbox"], name: "messages_global_message_id_mailbox_index"
    t.index ["list_id_hash"], name: "messages_list_id_hash_index"
    t.index ["mailbox", "conversation_id", "date_received", "deleted"], name: "messages_mailbox_conversation_id_date_received_deleted_index"
    t.index ["mailbox", "date_received"], name: "messages_mailbox_date_received_index"
    t.index ["mailbox", "display_date"], name: "messages_mailbox_display_date_index"
    t.index ["message_id", "mailbox"], name: "messages_message_id_mailbox_index"
    t.index ["remote_mailbox", "remote_id"], name: "messages_remote_mailbox_remote_id_index"
    t.index ["root_status"], name: "messages_root_status_index"
    t.index ["searchable_message", "deleted"], name: "messages_searchable_message_deleted_index"
    t.index ["sender", "subject", "automated_conversation"], name: "messages_sender_subject_automated_conversation_index"
    t.index ["sender"], name: "messages_sender_index"
    t.index ["subject", "fuzzy_ancestor"], name: "messages_subject_fuzzy_ancestor_index"
    t.index ["subject"], name: "messages_subject_index"
    t.index ["summary"], name: "messages_summary_index"
    t.index ["type"], name: "messages_type_index"
  end

# Could not dump table "properties" because of following StandardError
#   Unknown type '' for column 'key'

  create_table "protected_message_data", primary_key: "ROWID", force: :cascade do |t|
    t.text "data"
  end

  create_table "recipients", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message", null: false
    t.integer "address", null: false
    t.integer "type"
    t.integer "position"
    t.index ["address"], name: "recipients_address_index"
    t.index ["message", "position", "type", "address"], name: "recipients_message_position_type_address_index"
  end

  create_table "remote_content_links", primary_key: "ROWID", force: :cascade do |t|
    t.text "url", null: false
    t.integer "requests", default: 0, null: false
    t.integer "last_seen_date", null: false
    t.integer "last_request_date", default: 0, null: false
    t.index ["requests", "last_request_date"], name: "remote_content_links_requests_last_request_date_index"
    t.index ["requests", "last_seen_date"], name: "remote_content_links_requests_last_seen_date_index"
  end

  create_table "rich_links", primary_key: "ROWID", force: :cascade do |t|
    t.text "title"
    t.text "url", null: false
    t.text "hash", null: false
  end

  create_table "searchable_attachments", primary_key: "attachment_id", force: :cascade do |t|
    t.integer "attachment"
    t.integer "message_id"
    t.integer "transaction_id", null: false
    t.index ["attachment"], name: "searchable_attachments_attachment_index"
    t.index ["message_id"], name: "searchable_attachments_message_id_index"
  end

  create_table "searchable_data_detection_results", primary_key: "ROWID", force: :cascade do |t|
    t.integer "data_detection_result"
    t.integer "message"
    t.integer "transaction_id", null: false
    t.index ["data_detection_result"], name: "searchable_data_detection_results_data_detection_result_index"
    t.index ["message"], name: "searchable_data_detection_results_message_index"
  end

  create_table "searchable_message_tombstones", primary_key: "ROWID", force: :cascade do |t|
    t.integer "type", null: false
    t.text "identifier", null: false
    t.integer "transaction_id"
    t.index ["transaction_id", "type", "identifier"], name: "searchable_message_tombstones_transaction_id_type_identifier_index"
  end

  create_table "searchable_messages", primary_key: "message_id", force: :cascade do |t|
    t.integer "message"
    t.integer "transaction_id", null: false
    t.integer "message_body_indexed", null: false
    t.integer "reindex_type", null: false
    t.index ["message", "reindex_type", "transaction_id"], name: "searchable_messages_message_reindex_type_transaction_id_index"
    t.index ["reindex_type", "message_id"], name: "searchable_messages_reindex_type_message_id_index", where: "reindex_type != 0"
    t.index ["transaction_id", "message_id"], name: "searchable_messages_transaction_id_message_id_index"
  end

  create_table "searchable_rebuild", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message_id", null: false
  end

  create_table "searchable_rich_links", primary_key: "rich_link_id", force: :cascade do |t|
    t.integer "rich_link"
    t.integer "message_id"
    t.integer "transaction_id", null: false
    t.index ["message_id"], name: "searchable_rich_links_message_id_index"
    t.index ["rich_link"], name: "searchable_rich_links_rich_link_index"
  end

  create_table "sender_addresses", primary_key: "address", force: :cascade do |t|
    t.integer "sender", null: false
    t.index ["sender"], name: "sender_addresses_sender_index"
  end

  create_table "senders", primary_key: "ROWID", force: :cascade do |t|
    t.text "contact_identifier"
    t.integer "bucket", default: 0, null: false
    t.integer "user_initiated", default: 1, null: false
    t.index ["bucket"], name: "senders_bucket_index"
  end

  create_table "server_labels", primary_key: ["server_message", "label"], force: :cascade do |t|
    t.integer "server_message", null: false
    t.integer "label", null: false
  end

  create_table "server_messages", primary_key: "ROWID", force: :cascade do |t|
    t.integer "message"
    t.integer "mailbox", null: false
    t.integer "sequence_identifier"
    t.integer "read", null: false
    t.integer "deleted", null: false
    t.integer "replied", null: false
    t.integer "flagged", null: false
    t.integer "draft", null: false
    t.integer "forwarded", null: false
    t.integer "redirected", null: false
    t.integer "junk_level_set_by_user", null: false
    t.integer "junk_level", null: false
    t.integer "flag_color", null: false
    t.integer "remote_id", null: false
    t.index ["message"], name: "server_messages_message_index"
  end

  create_table "subjects", primary_key: "ROWID", force: :cascade do |t|
    t.text "subject", null: false
  end

  create_table "summaries", primary_key: "ROWID", force: :cascade do |t|
    t.text "summary", null: false
  end

  add_foreign_key "action_flags", "local_message_actions", column: "action", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "action_labels", "local_message_actions", column: "action", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "action_labels", "mailboxes", column: "label", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "action_messages", "local_message_actions", column: "action", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "action_messages", "messages", column: "destination_message", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "action_messages", "messages", column: "message", primary_key: "ROWID", on_delete: :nullify
  add_foreign_key "attachments", "messages", column: "message", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "conversation_id_message_id", "conversations", primary_key: "conversation_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "duplicates_unread_count", "mailboxes", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "events", "messages", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "ews_folders", "mailboxes", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "labels", "mailboxes", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "labels", "messages", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "last_spotlight_check_date", "messages", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "local_message_actions", "mailboxes", column: "destination_mailbox", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "local_message_actions", "mailboxes", column: "mailbox", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "local_message_actions", "mailboxes", column: "source_mailbox", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "message_references", "messages", column: "message", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "message_rich_links", "message_global_data", column: "global_message_id", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "message_rich_links", "rich_links", column: "rich_link", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "searchable_attachments", "attachments", column: "attachment", primary_key: "ROWID", on_delete: :nullify
  add_foreign_key "searchable_messages", "messages", column: "message", primary_key: "ROWID", on_delete: :nullify
  add_foreign_key "searchable_rich_links", "rich_links", column: "rich_link", primary_key: "ROWID", on_delete: :nullify
  add_foreign_key "sender_addresses", "senders", column: "sender", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "server_labels", "mailboxes", column: "label", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "server_labels", "server_messages", column: "server_message", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "server_messages", "mailboxes", column: "mailbox", primary_key: "ROWID", on_delete: :cascade
  add_foreign_key "server_messages", "messages", column: "message", primary_key: "ROWID", on_delete: :nullify
end
