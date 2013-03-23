class RemoveVideoColumnFromMusic < ActiveRecord::Migration
  def up
    remove_column :musics, :video
    remove_column :musics, :counter
    add_column :musics, :counter, :integer, :default=>0
  end

  def down
    remove_column :musics, :counter
  end
end
