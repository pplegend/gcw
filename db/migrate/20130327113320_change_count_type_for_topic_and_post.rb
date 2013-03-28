class ChangeCountTypeForTopicAndPost < ActiveRecord::Migration
  def up
   remove_column :topics, :posts_count
   add_column :topics, :posts_count, :integer,:default=>0
   remove_column :forums, :topics_count
   add_column :forums, :topics_count, :integer,:default=>0
  end

  def down
  end
end
