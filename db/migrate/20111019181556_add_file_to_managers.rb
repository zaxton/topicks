class AddFileToManagers < ActiveRecord::Migration
    def self.up
        add_column :managers, :file_file_name, :string
        add_column :managers, :file_content_type, :string
        add_column :managers, :file_file_size, :integer
        add_column :managers, :file_updated_at, :datetime
    end

    def self.down
        remove_column :managers, :file_file_name
        remove_column :managers, :file_content_type
        remove_column :managers, :file_file_size
        remove_column :managers, :file_updated_at
    end
end
