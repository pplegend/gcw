#!/bin/env ruby
# encoding: utf-8 
class MusicsController < ApplicationController
 
  before_filter :check_administrator_role, :only=> [:new, :create, :destroy]
  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
    @newest_contents=Music.limit(10).order('created_at asc')
    @hot_contents=Music.limit(10).order('counter desc')
    @recomand_contents=Music.limit(10)
    @music_categories = MusicCategory.all
    @hot_title="热门广场舞曲下载"
    @recomand_title="推荐广场舞曲下载"
    @newest_title="最新广场舞曲下载"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musics }
    end
  end
  def ajax_show
    @musics = Music.all
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def ajax_display
   @music=Music.find(params[:id])
    respond_to do |format|
      format.js { render layout: false }
    end
  end
  # GET /musics/1
  # GET /musics/1.json
  def show
    @music = Music.find(params[:id])
    @newest_musics=Music.limit(10).order('created_at asc')
    @hot_musics=Music.limit(10).order('counter desc')
    @recomand_musics=Music.limit(10)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.json
  def new
    @music = Music.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/1/edit
  def edit
    @music = Music.find(params[:id])
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(params[:music])

    respond_to do |format|
      if @music.save
        format.html { redirect_to @music, notice: 'Music was successfully created.' }
        format.json { render json: @music, status: :created, location: @music }
      else
        format.html { render action: "new" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musics/1
  # PUT /musics/1.json
  def update
    @music = Music.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to musics_url }
      format.json { head :no_content }
    end
  end
   def download
	@music = Music.find(params[:fileid]) #test.mp3
	file_name=params[:filename]	
	file_path="#{Rails.root}/public"+File.join(
  		File.dirname(params[:filepath]),file_name)
	file_name=params[:filename]
      if File.exist?(file_path)
        #send_file file_path,:disposition => 'inline'
        io = File.open(file_path)
        io.binmode
        send_data(io.read,:filename =>file_name,:disposition => 'attachment')
        io.close
	@music.counter=@music.counter+1
	@music.save
      else
	@out=file_path
      end
	return
   end
end
