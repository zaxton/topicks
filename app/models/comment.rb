# SQL Refernce Sheet
# t.integer  "user_id"
# t.integer  "topic_id"
# t.string   "content"
#
class Comment < ActiveRecord::Base
    attr_accessible :contnet
    belongs_to :topic
end