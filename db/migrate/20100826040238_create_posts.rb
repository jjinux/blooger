class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :body, :null => false

      t.timestamps
    end

    add_foreign_key :posts, :users, :dependent => :delete
  end

  def self.down
    drop_table :posts
  end
end
