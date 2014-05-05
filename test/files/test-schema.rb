create_table "batch_documents", :force => true do |t|
  t.integer  "batch_id"
  t.integer  "document_id"
  t.string   "status",      :default => "pending", :null => false
  t.datetime "created_at",                         :null => false
  t.datetime "updated_at",                         :null => false
  t.string   "name"
  t.datetime "deleted_at"
end

add_index "batch_documents", ["batch_id"], :name => "index_batch_documents_on_batch_id"
add_index "batch_documents", ["deleted_at"], :name => "index_batch_documents_on_deleted_at"
add_index "batch_documents", ["document_id"], :name => "index_batch_documents_on_document_id"
add_index "batch_documents", ["status"], :name => "index_batch_documents_on_status"

create_table "batches", :force => true do |t|
  t.integer  "shipment_id"
  t.string   "batch_type"
  t.integer  "quantity"
  t.integer  "sort"
  t.string   "status",      :default => "pending", :null => false
  t.datetime "created_at",                         :null => false
  t.datetime "updated_at",                         :null => false
  t.integer  "custom_sort"
  t.datetime "deleted_at"
end
