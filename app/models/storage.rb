# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "folder_name"
#
class Storage < ActiveRecord::Base
    attr_accessible :folder_name
    belongs_to :user
    has_many :managers
    
    accepts_nested_attributes_for :managers,
         :reject_if => proc { |attributes| attributes.blank? }, 
         :allow_destroy => true
end
