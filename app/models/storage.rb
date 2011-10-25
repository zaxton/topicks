# SQL Reference Sheet
# t.integer  "user_id"
# t.string   "folder_name"
#
class Storage < ActiveRecord::Base
    attr_accessible :folder_name
    belongs_to :user
    has_many :managers
    
    validates :user_id, :presence => true
    validates :folder_name, :presence => true, 
                            :length => {:maximum => 40}
    
    accepts_nested_attributes_for :managers,
         :reject_if => proc { |attributes| attributes.blank? }, 
         :allow_destroy => true
         
    def self.search(search)
        if search
            where('folder_name LIKE ?', "%#{search}%")
        else
            scoped
        end
    end
end
