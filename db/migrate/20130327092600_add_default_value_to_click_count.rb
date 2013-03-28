class AddDefaultValueToClickCount < ActiveRecord::Migration
  def change
  remove_column :topics, :click_count
  remove_column :posts, :click_count
  add_column :topics, :click_count, :integer, :default=>0
  add_column :posts, :click_count, :integer, :default=>0
  end
end
