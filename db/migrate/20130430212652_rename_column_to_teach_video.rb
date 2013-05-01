class RenameColumnToTeachVideo < ActiveRecord::Migration
  def change
	rename_column :teach_videos, :group, :group_id
  end

 
end
