class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
         t.integer :user_id
         t.string :web_name
         t.string :description
         t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
