class CreatePtopics < ActiveRecord::Migration
  def self.up
    create_table :ptopics do |t|
      t.integer :user_id
      t.integer :people_id
      t.string :content
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ptopics
  end
end
