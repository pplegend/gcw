class AddMusicCategoryIdToMusic < ActiveRecord::Migration
  def change
   add_column :musics, :music_category_id, :integer
  end
end
