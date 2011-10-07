# SQL Reference Page
# t.integer  "user_id"
# t.string   "expertise"
# t.string   "type"
#
class Profile < ActiveRecord::Base
    attr_accessible :expertise, :type
    belongs_to :user
    
    def self.inheritance_column
         "rails_type"
    end
end
