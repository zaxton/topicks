# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "category"
# t.string   "content"
#
class Topic < ActiveRecord::Base
    attr_accessible :category, :content, :rating
    has_many :comments
    belongs_to :user
    
    accepts_nested_attributes_for :comments,
        :reject_if => proc { |attributes| attributes.blank? }, 
        :allow_destroy => true
        
    def self.search(search)
        if search
            where('category LIKE ?', "%#{search}%")
        else
            scoped
        end
    end
end
