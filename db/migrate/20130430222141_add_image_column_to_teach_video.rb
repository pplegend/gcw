class AddImageColumnToTeachVideo < ActiveRecord::Migration
  def self.up
   add_attachment :teach_videos, :image
  end
  def self.down
   remove_attachment :teach_videos, :image
  end
end
