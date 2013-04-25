class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rate
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
