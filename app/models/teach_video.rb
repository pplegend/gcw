class TeachVideo < ActiveRecord::Base
  attr_accessible :counter, :download_link, :group, :name, :source, :youkuid
  def next
    if TeachVideo.last.id > id
       TeachVideo.where("id > ?", id).order("id ASC").first.name 
       
    else
      "no next teaching video"
    end
  end

  def prev
      if TeachVideo.first.id < id
       TeachVideo.where("id < ?", id).order("id ASC").first.name 
      
    else
      "no prev teaching video"
    end
  end
end
