class RecordVideo < ActiveRecord::Base
  attr_accessible :counter, :name, :source, :tuanti_id, :youkuid, :image
  has_attached_file :image, :styles=>{:medium=>"300x300>", :thumb=>"128x96>"}
  belongs_to :tuanti

  
end
