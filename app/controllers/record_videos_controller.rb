#!/bin/env ruby
# encoding: utf-8
class RecordVideosController < ApplicationController

  def ajax_show
     @record_videos=RecordVideo.all
     respond_to do |format|
      format.js { render layout: false }
    end
  end
  # GET /record_videos
  # GET /record_videos.json
  def index
    @record_videos = RecordVideo.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
    
    @tuantis= Tuanti.all

     @hot_contents = RecordVideo.all
    @hot_title="热门广场舞视频"
    @newest_title="最新广场舞视频"
    @recomand_title="推荐广场舞视频"
    @newest_contents = RecordVideo.all
    @recomand_contents = RecordVideo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @record_videos }
    end
  end

  # GET /record_videos/1
  # GET /record_videos/1.json
  def show
    @record_video = RecordVideo.find(params[:id])
    @hot_contents = RecordVideo.all
    @newest_contents = RecordVideo.all
    @recomand_contents = RecordVideo.all
    @hot_title="热门广场舞视频"
    @newest_title="最新广场舞视频"
    @recomand_title="推荐广场舞视频"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @record_video }
    end
  end

  # GET /record_videos/new
  # GET /record_videos/new.json
  def new
    @record_video = RecordVideo.new
    @tuantis= Tuanti.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @record_video }
    end
  end

  # GET /record_videos/1/edit
  def edit
    @record_video = RecordVideo.find(params[:id])
  end

  # POST /record_videos
  # POST /record_videos.json
  def create
    @record_video = RecordVideo.new(params[:record_video])

    respond_to do |format|
      if @record_video.save
        format.html { redirect_to @record_video, notice: 'Record video was successfully created.' }
        format.json { render json: @record_video, status: :created, location: @record_video }
      else
        format.html { render action: "new" }
        format.json { render json: @record_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /record_videos/1
  # PUT /record_videos/1.json
  def update
    @record_video = RecordVideo.find(params[:id])

    respond_to do |format|
      if @record_video.update_attributes(params[:record_video])
        format.html { redirect_to @record_video, notice: 'Record video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_videos/1
  # DELETE /record_videos/1.json
  def destroy
    @record_video = RecordVideo.find(params[:id])
    @record_video.destroy

    respond_to do |format|
      format.html { redirect_to record_videos_url }
      format.json { head :no_content }
    end
  end
end
