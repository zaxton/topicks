class CreatePcomments < ActiveRecord::Migration
  def self.up
    create_table :pcomments do |t|
      t.integer :user_id
      t.integer :ptopic_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :pcomments
  end
end
