class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :link
      t.has_attached_file :image
      t.timestamps
    end
  end
end
