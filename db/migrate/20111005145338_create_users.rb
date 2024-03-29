class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
        t.string :username
        t.string :name
        t.string :email
        t.boolean :admin
        t.string :password_rem_token
        t.string :password_hash
        t.string :password_salt
        t.string :birthday
        
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
