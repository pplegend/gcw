class AddReadCounterToTopicAndPost < ActiveRecord::Migration
  def change
   add_column :topics, :click_count, :integer
   add_column :posts, :click_count, :integer
  end
end
