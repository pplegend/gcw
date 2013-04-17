class Music < ActiveRecord::Base
  attr_accessible :counter, :video, :video_file_name

   has_attached_file :video, :styles => {
    :mobile => {:geometry => "400x300", :format => 'ogg', :streaming => true}
  }, :processors => [:ffmpeg, :qtfaststart]
 

end
