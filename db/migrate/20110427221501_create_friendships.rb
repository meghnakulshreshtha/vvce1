class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :friend_id
      t.references :user
      t.boolean :accept, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end
end
