class AddRatingToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :rating, :integer
  end

  def self.down
    remove_column :topics, :rating
  end
end
