class CreateTeachVideos < ActiveRecord::Migration
  def change
    create_table :teach_videos do |t|
      t.string :name
      t.string :source
      t.string :download_link
      t.string :youkuid
      t.integer :group
      t.integer :counter, :default=>0

      t.timestamps
    end
  end
end
