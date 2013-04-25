class CreateComments < ActiveRecord::Migration
  def change
    drop_table :comments
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :image_id
      t.timestamps
    end
  end
   def self.down
     drop_table :comments
  end
end
