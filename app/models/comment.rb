# SQL Refernce Sheet
# t.integer  "user_id"
# t.integer  "topic_id"
# t.string   "content"
#
class Comment < ActiveRecord::Base
    attr_accessible :content
    belongs_to :topic
    
    default_scope :order => 'comments.created_at DESC'
end
