class Music < ActiveRecord::Base
  attr_accessible :counter, :video, :video_file_name
  belongs_to :music_category
   has_attached_file :video, :styles => {
    :mobile => {:geometry => "400x300", :format => 'ogg', :streaming => true}
  }, :processors => [:ffmpeg, :qtfaststart]
 
   def next
    if Music.last.id > id
       Music.where("id > ?", id).order("id ASC").first.video_file_name 
       
    else
      "no next music"
    end
  end

  def prev
      if Music.first.id < id
       Music.where("id < ?", id).order("id ASC").first.video_file_name 
      
    else
      "no next music"
    end
  end
  def name
 
    last=video_file_name.rindex('.')
    video_file_name[7,4]=""
    video_file_name
  end
end
