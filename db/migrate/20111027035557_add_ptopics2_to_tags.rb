class AddPtopics2ToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :ptopic_id, :integer
  end

  def self.down
    remove_column :tags, :ptopic_id
  end
end
