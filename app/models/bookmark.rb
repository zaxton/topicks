# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "web_name"
# t.string   "description"
# t.string   "url"
#
class Bookmark < ActiveRecord::Base
    attr_accessible :web_name, :description, :url
    belongs_to :user
end
