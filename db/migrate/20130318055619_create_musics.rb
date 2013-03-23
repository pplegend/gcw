class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :video
      t.string :video_file_name
      t.integer :counter

      t.timestamps
    end
  end
end
