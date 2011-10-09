# SQL Reference Page
# t.integer  "user_id"
# t.string   "expertise"
# t.string   "kind"
#
class Profile < ActiveRecord::Base
    attr_accessible :expertise, :kind
    belongs_to :user

end
