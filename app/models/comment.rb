# SQL Refernce Sheet
# t.integer  "user_id"
# t.integer  "topic_id"
# t.string   "content"
#
class Comment < ActiveRecord::Base
    attr_accessible :content
    belongs_to :topic
    
    def self.feed(last)
        self.where("created_at < ? ", last).order('created_at desc').limit(10)
    end
end
