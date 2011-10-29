# SQL Refernce Sheet
# t.integer  "user_id"
# t.integer  "people_id"
# t.string   "content"
# t.string   "name"
#
class Ptopic < ActiveRecord::Base
    attr_accessible :content, :name
    belongs_to :user
end
