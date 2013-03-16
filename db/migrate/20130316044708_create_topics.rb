class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :forum_id
      t.integer :user_id
      t.string :title
      t.string :posts_count
      t.text :body
      t.timestamps
    end
  end
end
