class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :user_id
      t.string :embed

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
