class ImagesController < ApplicationController
  def index
   @images=Image.paginate(:page => params[:page],:per_page => 10).order('created_at DESC')
  end

  def new
    @image = Image.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  def update
   @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to(@image, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(images_url) }
      format.xml  { head :ok }
    end
  end

  def edit
   @image = Image.find(params[:id])
  end

  def show
    @image = Image.find(params[:id])
    @comments=@image.comments.paginate(:page=> params[:page],:per_page=>6)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

    def create
    @image = Image.new(params[:image])
   # @product.categories.create
    respond_to do |format|
      if @image.save
	    
        format.html { redirect_to(@image, :notice => 'Image was successfully created.') }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end
end