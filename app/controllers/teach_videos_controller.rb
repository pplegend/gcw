#!/bin/env ruby
# encoding: utf-8 
class TeachVideosController < ApplicationController
  before_filter :check_administrator_role, :only=> [:new, :create, :destroy]
  def ajax_display_page
     @teach_video = TeachVideo.find(params[:id])
     
     	@teach_video.counter=@teach_video.counter+1
     	@teach_video.save
	
      
     respond_to do |format|
        
      format.js { render layout: false }
     end
  end
  def ajax_show
   @teach_videos=TeachVideo.all
   respond_to do |format|
      format.js { render layout: false }
    end
  end
  # GET /teach_videos
  # GET /teach_videos.json
  def index
    @teach_videos = TeachVideo.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
    @groups= Group.all
    @hot_contents = TeachVideo.all
    @hot_title="热门广场舞教学视频"
    @newest_title="最新广场舞教学视频"
    @recomand_title="推荐广场舞教学视频"
    @newest_contents = TeachVideo.all
    @recomand_contents = TeachVideo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teach_videos }
    end
  end

  # GET /teach_videos/1
  # GET /teach_videos/1.json
  def show
    @teach_video = TeachVideo.find(params[:id])
    @hot_contents = TeachVideo.all
    @newest_contents = TeachVideo.all
    @recomand_contents = TeachVideo.all
    @hot_title="热门广场舞教学视频"
    @newest_title="最新广场舞教学视频"
    @recomand_title="推荐广场舞教学视频"
    respond_to do |format|
	@teach_video.counter=@teach_video.counter+1 
	@teach_video.save
      format.html # show.html.erb
      format.json { render json: @teach_video }
    end
  end

  # GET /teach_videos/new
  # GET /teach_videos/new.json
  def new
    @teach_video = TeachVideo.new
    @groups= Group.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teach_video }
    end
  end

  # GET /teach_videos/1/edit
  def edit
    @teach_video = TeachVideo.find(params[:id])
    @groups= Group.all
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
