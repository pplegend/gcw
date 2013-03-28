class ChangeClickColumnToOrderNumberInPost < ActiveRecord::Migration
  def up
   remove_column :posts, :click_count
   add_column :posts, :cixu, :integer, :default=>1
  end

  def down
  end
end
