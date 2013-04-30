class TeachVideosController < ApplicationController
  # GET /teach_videos
  # GET /teach_videos.json
  def index
    @teach_videos = TeachVideo.all
    @hot_teach_videos = TeachVideo.all
    @newest_teach_videos = TeachVideo.all
    @recomand_teach_videos = TeachVideo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teach_videos }
    end
  end

  # GET /teach_videos/1
  # GET /teach_videos/1.json
  def show
    @teach_video = TeachVideo.find(params[:id])
    @hot_teach_videos = TeachVideo.all
    @newest_teach_videos = TeachVideo.all
    @recomand_teach_videos = TeachVideo.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teach_video }
    end
  end

  # GET /teach_videos/new
  # GET /teach_videos/new.json
  def new
    @teach_video = TeachVideo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teach_video }
    end
  end

  # GET /teach_videos/1/edit
  def edit
    @teach_video = TeachVideo.find(params[:id])
  end

  # POST /teach_videos
  # POST /teach_videos.json
  def create
    @teach_video = TeachVideo.new(params[:teach_video])

    respond_to do |format|
      if @teach_video.save
        format.html { redirect_to @teach_video, notice: 'Teach video was successfully created.' }
        format.json { render json: @teach_video, status: :created, location: @teach_video }
      else
        format.html { render action: "new" }
        format.json { render json: @teach_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teach_videos/1
  # PUT /teach_videos/1.json
  def update
    @teach_video = TeachVideo.find(params[:id])

    respond_to do |format|
      if @teach_video.update_attributes(params[:teach_video])
        format.html { redirect_to @teach_video, notice: 'Teach video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teach_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teach_videos/1
  # DELETE /teach_videos/1.json
  def destroy
    @teach_video = TeachVideo.find(params[:id])
    @teach_video.destroy

    respond_to do |format|
      format.html { redirect_to teach_videos_url }
      format.json { head :no_content }
    end
  end
end
