# SQL Reference Sheet
# t.integer  "tag_id"
#
class Tag < ActiveRecord::Base
    attr_accessor :tag_tokens
    attr_accessible :tag_id, :ptopic_id
    belongs_to :user
end
