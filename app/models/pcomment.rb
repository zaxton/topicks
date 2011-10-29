# SQL Refernce Sheet
# t.integer  "user_id"
# t.integer  "ptopic_id"
# t.string   "content"
#
class Pcomment < ActiveRecord::Base
    attr_accessible :content
    belongs_to :ptopic
end
