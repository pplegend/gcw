class HomeController < ApplicationController
  def index
    @uploads = Upload.limit(8)
    @recomand_musics=Music.limit(6)
    @news=News.limit(6)
    @new_topics=Topic.limit(5).order("created_at desc")
    @teach_videos= TeachVideo.limit(4).order("counter desc")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
      
    end
  end
end
