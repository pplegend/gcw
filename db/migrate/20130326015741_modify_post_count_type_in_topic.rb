class ModifyPostCountTypeInTopic < ActiveRecord::Migration
  def up
    remove_column :topics, :posts_count
    add_column :topics, :posts_count, :integer
  end

  def down
  end
end
