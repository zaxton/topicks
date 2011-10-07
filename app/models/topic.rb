# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "category"
# t.string   "content"
#
class Topic < ActiveRecord::Base
    attr_accessible :category, :content
    has_many :comments
    belongs_to :user
end
