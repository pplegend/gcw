class Slide < ActiveRecord::Base
  attr_accessible :link, :image, :title
  has_attached_file :image, :styles=>{:medium=>"300x300>", :thumb=>"100x100>"}
end
