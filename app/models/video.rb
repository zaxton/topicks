# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "embed"
#
class Video < ActiveRecord::Base
    attr_accessible :name, :embed
    belongs_to :user
end
