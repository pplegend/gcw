class CreateRecordVideos < ActiveRecord::Migration
  def change
    create_table :record_videos do |t|
      t.string :name
      t.string :source
      t.string :youkuid
      t.integer :tuanti_id
      t.integer :counter, :default=>0
      t.timestamps
    end
    add_attachment :record_videos, :image
  end
end
