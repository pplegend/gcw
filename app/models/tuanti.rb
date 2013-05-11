class Tuanti < ActiveRecord::Base
  attr_accessible :description, :name, :image
  has_attached_file :image, :styles=>{:medium=>"300x300>", :thumb=>"250x150>"}
  has_many :record_videos
end
