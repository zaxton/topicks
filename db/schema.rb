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

ActiveRecord::Schema.define(:version => 20111029142557) do

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.string   "web_name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["id"], :name => "comment_select"
  add_index "comments", ["topic_id"], :name => "comment_topic"
  add_index "comments", ["user_id"], :name => "comment_user"

  create_table "managers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "storage_id"
  end

  create_table "pcomments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ptopic_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "expertise"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ptopics", :force => true do |t|
    t.integer  "user_id"
    t.integer  "people_id"
    t.string   "content"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storages", :force => true do |t|
    t.integer  "user_id"
    t.string   "folder_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ptopic_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "category"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "rating",     :limit => nil
  end

  add_index "topics", ["id"], :name => "topic_id"
  add_index "topics", ["user_id"], :name => "topic_user"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.string   "password_rem_token"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "birthday"
  end

  add_index "users", ["id"], :name => "user_index"

  create_table "videos", :force => true do |t|
    t.integer  "user_id"
    t.string   "embed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
