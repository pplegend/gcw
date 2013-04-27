class CommentsController < ApplicationController
   before_filter :authenticate, :only=> :create

  def index
   @image=Image.find(params[:image_id])
    @comments = @image.comments.paginate(:page=> params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def create
      @image=Image.find(params[:image_id])
    respond_to do |format|
      if @comment=@image.comments.create!(params[:comment])
        format.html { redirect_to(@image, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
        format.js 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end
end
