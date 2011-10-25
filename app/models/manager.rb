# SQL Reference Sheet
# t.integer  "user_id"
# t.integer  "limit"
# t.string   "file_file_name"
# t.string   "file_content_type"
# t.integer  "file_file_size"
# t.datetime "file_updated_at"
#
class Manager < ActiveRecord::Base
    attr_accessible :file, :file_attributes, :limit
    belongs_to :storage
    
    has_attached_file :file
    
    def self.search(search)
        if search
            where('file_file_name LIKE ?', "%#{search}%")
        else
            scoped
        end
    end
end
