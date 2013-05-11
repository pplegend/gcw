class CreateTuantis < ActiveRecord::Migration
  def change
    create_table :tuantis do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    add_attachment :tuantis, :image
  end
end
