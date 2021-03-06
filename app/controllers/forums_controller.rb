#!/bin/env ruby
# encoding: utf-8
class ForumsController < ApplicationController
  before_filter :check_administrator_role, :only=> [:new, :create, :destroy]
  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all
    @slides = Slide.all
    @newest_topics=Topic.order("created_at DESC").limit(6)
    @hot_topics=Topic.order("posts_count DESC").limit(6)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

 def show
  @forum=Forum.find(params[:id])
  redirect_to forum_topics_path(@forum)
 end
  # GET /forums/new
  # GET /forums/new.json
  def new
    @forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = Forum.new(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to forums_path, notice: 'Forum was successfully created.' }
        format.json { render json: @forum, status: :created, location: @forum }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.json
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end
end
